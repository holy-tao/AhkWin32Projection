#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicViewConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicViewConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{e241756e-e0d0-5019-9af5-1b165bc2f54e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedDepthReprojectionMethods"]

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedDepthReprojectionMethods {
        get => this.get_SupportedDepthReprojectionMethods()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedDepthReprojectionMethods() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
