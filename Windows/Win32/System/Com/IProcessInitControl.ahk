#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Specifies the process initialization time-out interval.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iprocessinitcontrol
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IProcessInitControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessInitControl
     * @type {Guid}
     */
    static IID => Guid("{72380d55-8d2b-43a3-8513-2b6ef31434e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResetInitializerTimeout"]

    /**
     * 
     * @param {Integer} dwSecondsRemaining 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iprocessinitcontrol-resetinitializertimeout
     */
    ResetInitializerTimeout(dwSecondsRemaining) {
        result := ComCall(3, this, "uint", dwSecondsRemaining, "HRESULT")
        return result
    }
}
