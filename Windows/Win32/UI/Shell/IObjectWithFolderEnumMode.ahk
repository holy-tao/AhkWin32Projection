#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FOLDER_ENUM_MODE.ahk" { FOLDER_ENUM_MODE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that get and set enumeration modes of a parsed item.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface is implemented as part of a Shell namespace extension, specifically the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * This interface is used by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a> method to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folder_enum_mode">FOLDER_ENUM_MODE</a> value which controls the enumeration mode of the parsed item.
 * 
 * Items with different enumeration modes compare canonically different (SHCIDS_CANONICALONLY) because they enumerate different sets of items.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithfolderenummode
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IObjectWithFolderEnumMode extends IUnknown {
    /**
     * The interface identifier for IObjectWithFolderEnumMode
     * @type {Guid}
     */
    static IID := Guid("{6a9d9026-0e6e-464c-b000-42ecc07de673}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectWithFolderEnumMode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMode : IntPtr
        GetMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectWithFolderEnumMode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the enumeration mode of the parsed item.
     * @param {FOLDER_ENUM_MODE} feMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folder_enum_mode">FOLDER_ENUM_MODE</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folder_enum_mode">FOLDER_ENUM_MODE</a> values that specify the enumeration mode.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithfolderenummode-setmode
     */
    SetMode(feMode) {
        result := ComCall(3, this, FOLDER_ENUM_MODE, feMode, "HRESULT")
        return result
    }

    /**
     * Retrieves the enumeration mode of the parsed item.
     * @returns {FOLDER_ENUM_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folder_enum_mode">FOLDER_ENUM_MODE</a>*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives one of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folder_enum_mode">FOLDER_ENUM_MODE</a> values specifying the enumeration mode.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithfolderenummode-getmode
     */
    GetMode() {
        result := ComCall(4, this, "int*", &pfeMode := 0, "HRESULT")
        return pfeMode
    }

    Query(iid) {
        if (IObjectWithFolderEnumMode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMode := CallbackCreate(GetMethod(implObj, "SetMode"), flags, 2)
        this.vtbl.GetMode := CallbackCreate(GetMethod(implObj, "GetMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMode)
        CallbackFree(this.vtbl.GetMode)
    }
}
