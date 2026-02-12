#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Composition\Visual.ahk
#Include ..\..\Composition\CompositionPropertySet.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IElementCompositionPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementCompositionPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{08c92b38-ec99-4c55-bc85-a1c180b27646}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetElementVisual", "GetElementChildVisual", "SetElementChildVisual", "GetScrollViewerManipulationPropertySet"]

    /**
     * 
     * @param {UIElement} element 
     * @returns {Visual} 
     */
    GetElementVisual(element) {
        result := ComCall(6, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Visual} 
     */
    GetElementChildVisual(element) {
        result := ComCall(7, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Visual} visual_ 
     * @returns {HRESULT} 
     */
    SetElementChildVisual(element, visual_) {
        result := ComCall(8, this, "ptr", element, "ptr", visual_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ScrollViewer} scrollViewer_ 
     * @returns {CompositionPropertySet} 
     */
    GetScrollViewerManipulationPropertySet(scrollViewer_) {
        result := ComCall(9, this, "ptr", scrollViewer_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionPropertySet(result_)
    }
}
