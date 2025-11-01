#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Display
 * @version v4.0.30319
 */
class IDisplayPathInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayPathInterop
     * @type {Guid}
     */
    static IID => Guid("{a6ba4205-e59e-4e71-b25b-4e436d21ee3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSourcePresentationHandle", "GetSourceId"]

    /**
     * 
     * @param {Pointer<HANDLE>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaypathinterop-createsourcepresentationhandle
     */
    CreateSourcePresentationHandle(pValue) {
        result := ComCall(3, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSourceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaypathinterop-getsourceid
     */
    GetSourceId(pSourceId) {
        pSourceIdMarshal := pSourceId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pSourceIdMarshal, pSourceId, "HRESULT")
        return result
    }
}
