#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Used by ISurrogateService to prevent the process from terminating due to a time-out.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iprocesslock
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IProcessLock extends IUnknown{
    /**
     * The interface identifier for IProcessLock
     * @type {Guid}
     */
    static IID => Guid("{000001d5-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    AddRefOnProcess() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    ReleaseRefOnProcess() {
        result := ComCall(4, this, "uint")
        return result
    }
}
