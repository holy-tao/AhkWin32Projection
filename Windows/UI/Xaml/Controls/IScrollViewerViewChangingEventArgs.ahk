#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ScrollViewerView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollViewerViewChangingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollViewerViewChangingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4dd04f7f-7a11-4b2e-9933-577df39252b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NextView", "get_FinalView", "get_IsInertial"]

    /**
     * @type {ScrollViewerView} 
     */
    NextView {
        get => this.get_NextView()
    }

    /**
     * @type {ScrollViewerView} 
     */
    FinalView {
        get => this.get_FinalView()
    }

    /**
     * @type {Boolean} 
     */
    IsInertial {
        get => this.get_IsInertial()
    }

    /**
     * 
     * @returns {ScrollViewerView} 
     */
    get_NextView() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScrollViewerView(value)
    }

    /**
     * 
     * @returns {ScrollViewerView} 
     */
    get_FinalView() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScrollViewerView(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertial() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
