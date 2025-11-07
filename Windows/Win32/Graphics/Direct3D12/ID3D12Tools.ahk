#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is used to configure the runtime for tools such as PIX. Its not intended or supported for any other scenario.
 * @remarks
 * 
 * Do not use this interface in your application, its not intended or supported for any scenario other than to enable tooling such as PIX.
 * 
 * Developer Mode must be enabled for this interface to respond.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12tools
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Tools extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Tools
     * @type {Guid}
     */
    static IID => Guid("{7071e1f0-e84b-4b33-974f-12fa49de65c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableShaderInstrumentation", "ShaderInstrumentationEnabled"]

    /**
     * 
     * @param {BOOL} bEnable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12tools-enableshaderinstrumentation
     */
    EnableShaderInstrumentation(bEnable) {
        ComCall(3, this, "int", bEnable)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12tools-shaderinstrumentationenabled
     */
    ShaderInstrumentationEnabled() {
        result := ComCall(4, this, "int")
        return result
    }
}
