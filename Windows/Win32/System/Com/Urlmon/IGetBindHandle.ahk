#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IGetBindHandle extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetBindHandle
     * @type {Guid}
     */
    static IID => Guid("{af0ff408-129d-4b20-91f0-02bd23d88352}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBindHandle"]

    /**
     * 
     * @param {Integer} enumRequestedHandle 
     * @returns {HANDLE} 
     */
    GetBindHandle(enumRequestedHandle) {
        pRetHandle := HANDLE()
        result := ComCall(3, this, "int", enumRequestedHandle, "ptr", pRetHandle, "HRESULT")
        return pRetHandle
    }
}
