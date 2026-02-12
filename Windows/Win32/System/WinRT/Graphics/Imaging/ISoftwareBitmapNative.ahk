#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\IInspectable.ahk

/**
 * Represents a software bitmap.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.imaging.interop/nn-windows-graphics-imaging-interop-isoftwarebitmapnative
 * @namespace Windows.Win32.System.WinRT.Graphics.Imaging
 * @version v4.0.30319
 */
class ISoftwareBitmapNative extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISoftwareBitmapNative
     * @type {Guid}
     */
    static IID => Guid("{94bc8415-04ea-4b2e-af13-4de95aa898eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData"]

    /**
     * GetDataProviderDSO Method
     * @remarks
     * This method does not addref the interface pointer. If the caller plans to hold the pointer, the caller must do the required addref and release.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getdataproviderdso-method
     */
    GetData(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
