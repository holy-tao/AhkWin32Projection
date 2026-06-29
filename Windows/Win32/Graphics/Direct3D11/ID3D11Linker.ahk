#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D11ModuleInstance.ahk" { ID3D11ModuleInstance }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A linker interface is used to link a shader module.
 * @remarks
 * To get a linker interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dcreatelinker">D3DCreateLinker</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11Linker</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11linker
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Linker extends IUnknown {
    /**
     * The interface identifier for ID3D11Linker
     * @type {Guid}
     */
    static IID := Guid("{59a6cd0e-e10d-4c1f-88c0-63aba1daf30e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Linker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Link                    : IntPtr
        UseLibrary              : IntPtr
        AddClipPlaneFromCBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Linker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Links the shader and produces a shader blob that the Direct3D runtime can use.
     * @param {ID3D11ModuleInstance} pEntry Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a> interface for the shader module instance to link from.
     * @param {PSTR} pEntryName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the shader module instance to link from.
     * @param {PSTR} pTargetName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name for the shader blob that is produced.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved.
     * @param {Pointer<ID3DBlob>} ppShaderBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the compiled shader code.
     * @param {Pointer<ID3DBlob>} ppErrorBuffer Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access compiler error messages.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11linker-link
     */
    Link(pEntry, pEntryName, pTargetName, uFlags, ppShaderBlob, ppErrorBuffer) {
        pEntryName := pEntryName is String ? StrPtr(pEntryName) : pEntryName
        pTargetName := pTargetName is String ? StrPtr(pTargetName) : pTargetName

        result := ComCall(3, this, "ptr", pEntry, "ptr", pEntryName, "ptr", pTargetName, "uint", uFlags, ID3DBlob.Ptr, ppShaderBlob, ID3DBlob.Ptr, ppErrorBuffer, "HRESULT")
        return result
    }

    /**
     * Adds an instance of a library module to be used for linking.
     * @param {ID3D11ModuleInstance} pLibraryMI Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance">ID3D11ModuleInstance</a> interface for the library module instance.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11linker-uselibrary
     */
    UseLibrary(pLibraryMI) {
        result := ComCall(4, this, "ptr", pLibraryMI, "HRESULT")
        return result
    }

    /**
     * Adds a clip plane with the plane coefficients taken from a cbuffer entry for 10Level9 shaders.
     * @param {Integer} uCBufferSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-constants">cbuffer</a> slot number.
     * @param {Integer} uCBufferEntry Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-constants">cbuffer</a> entry number.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11linker-addclipplanefromcbuffer
     */
    AddClipPlaneFromCBuffer(uCBufferSlot, uCBufferEntry) {
        result := ComCall(5, this, "uint", uCBufferSlot, "uint", uCBufferEntry, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11Linker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Link := CallbackCreate(GetMethod(implObj, "Link"), flags, 7)
        this.vtbl.UseLibrary := CallbackCreate(GetMethod(implObj, "UseLibrary"), flags, 2)
        this.vtbl.AddClipPlaneFromCBuffer := CallbackCreate(GetMethod(implObj, "AddClipPlaneFromCBuffer"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Link)
        CallbackFree(this.vtbl.UseLibrary)
        CallbackFree(this.vtbl.AddClipPlaneFromCBuffer)
    }
}
