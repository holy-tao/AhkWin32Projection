#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SemanticZoomLocation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISemanticZoomViewChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISemanticZoomViewChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{47dfc068-b569-4b19-842d-8e6cf90989af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSourceZoomedInView", "put_IsSourceZoomedInView", "get_SourceItem", "put_SourceItem", "get_DestinationItem", "put_DestinationItem"]

    /**
     * @type {Boolean} 
     */
    IsSourceZoomedInView {
        get => this.get_IsSourceZoomedInView()
        set => this.put_IsSourceZoomedInView(value)
    }

    /**
     * @type {SemanticZoomLocation} 
     */
    SourceItem {
        get => this.get_SourceItem()
        set => this.put_SourceItem(value)
    }

    /**
     * @type {SemanticZoomLocation} 
     */
    DestinationItem {
        get => this.get_DestinationItem()
        set => this.put_DestinationItem(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSourceZoomedInView() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSourceZoomedInView(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SemanticZoomLocation} 
     */
    get_SourceItem() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SemanticZoomLocation(value)
    }

    /**
     * 
     * @param {SemanticZoomLocation} value 
     * @returns {HRESULT} 
     */
    put_SourceItem(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SemanticZoomLocation} 
     */
    get_DestinationItem() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SemanticZoomLocation(value)
    }

    /**
     * 
     * @param {SemanticZoomLocation} value 
     * @returns {HRESULT} 
     */
    put_DestinationItem(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
