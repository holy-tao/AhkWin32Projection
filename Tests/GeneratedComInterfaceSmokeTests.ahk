#Requires AutoHotkey v2.0

#Include .\Yunit\Yunit.ahk
#Include .\YunitExtensions\Assert.ahk

#Include ../Windows/Win32/System/Com/Apis.ahk
#Include ../Windows/Win32/System/Com/IUri.ahk
#Include ../Windows/Win32/Foundation/BSTR.ahk

#DllLoad Urlmon.dll

class GeneratedComInterfaceTests {

    /**
     * Suuuper simple smoke test
     */
    Constructor_FromPtr_CreatesInterface(){
        result := Com.CreateUri("https://www.autohotkey.com/", 0x0101, &ppUri := 0)
        uri := IUri(ppUri)

        uri.GetDomain(domain := BSTR())
        Assert.Equals(String(domain), "autohotkey.com")
    }
}