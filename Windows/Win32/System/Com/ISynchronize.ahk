#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides asynchronous communication between objects about the occurrence of an event.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronize
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronize extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronize
     * @type {Guid}
     */
    static IID => Guid("{00000030-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Wait", "Signal", "Reset"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronize-wait
     */
    Wait(dwFlags, dwMilliseconds) {
        result := ComCall(3, this, "uint", dwFlags, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronize-signal
     */
    Signal() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronize-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
