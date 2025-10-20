#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Retrieves a handle associated with a synchronization object.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronizehandle
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeHandle extends IUnknown{
    /**
     * The interface identifier for ISynchronizeHandle
     * @type {Guid}
     */
    static IID => Guid("{00000031-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<HANDLE>} ph 
     * @returns {HRESULT} 
     */
    GetHandle(ph) {
        result := ComCall(3, this, "ptr", ph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
