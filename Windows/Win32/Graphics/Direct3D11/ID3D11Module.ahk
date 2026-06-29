#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D11ModuleInstance.ahk" { ID3D11ModuleInstance }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A module interface creates an instance of a module that is used for resource rebinding.
 * @remarks
 * To get a module interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dloadmodule">D3DLoadModule</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11Module</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11module
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Module extends IUnknown {
    /**
     * The interface identifier for ID3D11Module
     * @type {Guid}
     */
    static IID := Guid("{cac701ee-80fc-4122-8242-10b39c8cec34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Module interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Module.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an instance of a shader module that is used for resource rebinding.
     * @param {PSTR} pNamespace Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of a shader module to initialize. This can be <b>NULL</b> if you don't want to specify a name for the module.
     * @returns {ID3D11ModuleInstance} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a> interface to initialize.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11module-createinstance
     */
    CreateInstance(pNamespace) {
        pNamespace := pNamespace is String ? StrPtr(pNamespace) : pNamespace

        result := ComCall(3, this, "ptr", pNamespace, "ptr*", &ppModuleInstance := 0, "HRESULT")
        return ID3D11ModuleInstance(ppModuleInstance)
    }

    Query(iid) {
        if (ID3D11Module.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstance)
    }
}
