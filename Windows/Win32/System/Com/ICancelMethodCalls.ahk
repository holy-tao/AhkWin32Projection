#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Manages cancellation requests on an outbound method call and monitors the current state of that method call on the server thread.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-icancelmethodcalls
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ICancelMethodCalls extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICancelMethodCalls
     * @type {Guid}
     */
    static IID => Guid("{00000029-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "TestCancel"]

    /**
     * 
     * @param {Integer} ulSeconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icancelmethodcalls-cancel
     */
    Cancel(ulSeconds) {
        result := ComCall(3, this, "uint", ulSeconds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icancelmethodcalls-testcancel
     */
    TestCancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
