#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is used to configure the runtime for tools such as PIX. Its not intended or supported for any other scenario.
 * @remarks
 * Do not use this interface in your application, it's not intended or supported for any scenario other than to enable tooling such as PIX.
 * 
 * Developer Mode must be enabled for this interface to respond.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12tools
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Tools extends IUnknown {
    /**
     * The interface identifier for ID3D12Tools
     * @type {Guid}
     */
    static IID := Guid("{7071e1f0-e84b-4b33-974f-12fa49de65c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Tools interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableShaderInstrumentation  : IntPtr
        ShaderInstrumentationEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Tools.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method enables tools such as PIX to instrument shaders.
     * @remarks
     * Do not use this interface in your application, it's not intended or supported for any scenario other than to enable tooling such as PIX.
     * 
     * Developer Mode must be enabled for this interface to respond.
     * @param {BOOL} bEnable Type: <b>BOOL</b>
     * 
     * TRUE to enable shader instrumentation; otherwise, FALSE.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12tools-enableshaderinstrumentation
     */
    EnableShaderInstrumentation(bEnable) {
        ComCall(3, this, BOOL, bEnable)
    }

    /**
     * Determines whether shader instrumentation is enabled.
     * @remarks
     * Do not use this interface in your application, it's not intended or supported for any scenario other than to enable tooling such as PIX.
     * 
     * Developer Mode must be enabled for this interface to respond.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if shader instrumentation is enabled; otherwise FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12tools-shaderinstrumentationenabled
     */
    ShaderInstrumentationEnabled() {
        result := ComCall(4, this, BOOL)
        return result
    }

    Query(iid) {
        if (ID3D12Tools.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableShaderInstrumentation := CallbackCreate(GetMethod(implObj, "EnableShaderInstrumentation"), flags, 2)
        this.vtbl.ShaderInstrumentationEnabled := CallbackCreate(GetMethod(implObj, "ShaderInstrumentationEnabled"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableShaderInstrumentation)
        CallbackFree(this.vtbl.ShaderInstrumentationEnabled)
    }
}
