#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectX\Direct3D11\IDirect3DSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSample2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSample2
     * @type {Guid}
     */
    static IID => Guid("{45078691-fce8-4746-a1c8-10c25d3d7cd3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Direct3D11Surface"]

    /**
     * @type {IDirect3DSurface} 
     */
    Direct3D11Surface {
        get => this.get_Direct3D11Surface()
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Direct3D11Surface() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DSurface(value)
    }
}
