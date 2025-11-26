#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IUnknown.ahk

/**
 * Retrieves a handle associated with a synchronization object.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronizehandle
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeHandle extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHandle"]

    /**
     * Retrieves a handle to the synchronization object.
     * @returns {HANDLE} A pointer to the variable that receives a handle to the synchronization object.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isynchronizehandle-gethandle
     */
    GetHandle() {
        ph := HANDLE()
        result := ComCall(3, this, "ptr", ph, "HRESULT")
        return ph
    }
}
