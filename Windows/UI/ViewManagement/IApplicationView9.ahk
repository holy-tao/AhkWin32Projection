#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\WindowManagement\WindowingEnvironment.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\WindowManagement\DisplayRegion.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationView9 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationView9
     * @type {Guid}
     */
    static IID => Guid("{9c6516f9-021a-5f01-93e5-9bdad2647574}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WindowingEnvironment", "GetDisplayRegions"]

    /**
     * @type {WindowingEnvironment} 
     */
    WindowingEnvironment {
        get => this.get_WindowingEnvironment()
    }

    /**
     * 
     * @returns {WindowingEnvironment} 
     */
    get_WindowingEnvironment() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowingEnvironment(value)
    }

    /**
     * 
     * @returns {IVectorView<DisplayRegion>} 
     */
    GetDisplayRegions() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayRegion, result_)
    }
}
