
using System.Threading.Tasks;
using Microsoft.Playwright;
using Xunit;

namespace Tests
{
    public class ExampleTest
    {
        [Fact]
        public async Task ShouldLoadExampleDotCom()
        {
            using var playwright = await Playwright.CreateAsync();
            var isHeadless = true;
            await using var browser = await playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = isHeadless });
            var page = await browser.NewPageAsync();
            await page.GotoAsync("https://example.com");
            var title = await page.TitleAsync();
            Assert.Contains("Example Domain", title);
        }
    }
}
