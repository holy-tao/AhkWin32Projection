#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IDirect3D11CaptureFrame2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3D11CaptureFrame2
     * @type {Guid}
     */
    static IID => Guid("{37869cfa-2b48-5ebf-9afb-dffd805defdb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DirtyRegions", "get_DirtyRegionMode"]

    /**
     * @type {IVectorView<RectInt32>} 
     */
    DirtyRegions {
        get => this.get_DirtyRegions()
    }

    /**
     * @type {Integer} 
     */
    DirtyRegionMode {
        get => this.get_DirtyRegionMode()
    }

    /**
     * 
     * @returns {IVectorView<RectInt32>} 
     */
    get_DirtyRegions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetRectInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DirtyRegionMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
