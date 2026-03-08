#Requires AutoHotkey v2.0

#Include ../Yunit/Yunit.ahk
#Include ../YunitExtensions/Assert.ahk

#Include ../../Windows/Win32/Foundation/NTSTATUS.ahk

class NTSTATUSExtensionTests {
    GetErrorMessage_GetsErrorMessage() {
        msg := NTSTATUS.GetErrorMessage(0xC000009A)
        msg := Trim(msg, " `r`n`t")
        Assert.Equals(msg, "Insufficient system resources exist to complete the API.")
    }
 
    ThrowIfError_WithErrorMessage_ThrowsOSError() {
        Assert.Throws(
            () => NTSTATUS.ThrowIfError(0xC000009A),
            OSError
        )
    }

    ThrowIfError_WithSuccess_DoesNotThrow() {
        NTSTATUS.ThrowIfError(0x00000000)
    }
}