#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SemanticZoom.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Communicates the info needed for a view to serve as one of the two possible views ([ZoomedOutView](semanticzoom_zoomedoutview.md) or [ZoomedInView](semanticzoom_zoomedinview.md)) of a [SemanticZoom](semanticzoom.md).
 * @remarks
 * The ISemanticZoomInformation interface provides info for a single view of a [SemanticZoom](semanticzoom.md) control. However, it doesn't provide info to synchronize the two views of a [SemanticZoom](semanticzoom.md). The [ZoomedInView](semanticzoom_zoomedinview.md) and [ZoomedOutView](semanticzoom_zoomedoutview.md) should be synchronized, so if a user selects a group in the [ZoomedOutView](semanticzoom_zoomedoutview.md), the details of that group are shown in the [ZoomedInView](semanticzoom_zoomedinview.md). You can use a [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) or add code to synchronize the views. Any controls that you bind to the same [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) will always have the same current item. If both views use the same [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) as the their data source, the [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) will synchronize the views automatically. Otherwise, you can handle the [SemanticZoom.ViewChangeStarted](semanticzoom_viewchangestarted.md) event and synchronize the items in the event handler. See [SemanticZoom](semanticzoom.md) for more info.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISemanticZoomInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISemanticZoomInformation
     * @type {Guid}
     */
    static IID => Guid("{a76a3b63-229b-4dc5-aa11-9d922fbf8a98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SemanticZoomOwner", "put_SemanticZoomOwner", "get_IsActiveView", "put_IsActiveView", "get_IsZoomedInView", "put_IsZoomedInView", "InitializeViewChange", "CompleteViewChange", "MakeVisible", "StartViewChangeFrom", "StartViewChangeTo", "CompleteViewChangeFrom", "CompleteViewChangeTo"]

    /**
     * Gets or sets the [SemanticZoom](semanticzoom.md) owner that hosts the implementing view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.semanticzoomowner
     * @type {SemanticZoom} 
     */
    SemanticZoomOwner {
        get => this.get_SemanticZoomOwner()
        set => this.put_SemanticZoomOwner(value)
    }

    /**
     * Gets or sets a value that indicates whether the implementing view is the active view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.isactiveview
     * @type {Boolean} 
     */
    IsActiveView {
        get => this.get_IsActiveView()
        set => this.put_IsActiveView(value)
    }

    /**
     * Gets or sets a value that indicates whether the implementing view is the semantically more complete zoomed-in view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.iszoomedinview
     * @type {Boolean} 
     */
    IsZoomedInView {
        get => this.get_IsZoomedInView()
        set => this.put_IsZoomedInView(value)
    }

    /**
     * 
     * @returns {SemanticZoom} 
     */
    get_SemanticZoomOwner() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SemanticZoom(value)
    }

    /**
     * 
     * @param {SemanticZoom} value 
     * @returns {HRESULT} 
     */
    put_SemanticZoomOwner(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActiveView() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsActiveView(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomedInView() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_IsZoomedInView(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the changes to related aspects of presentation (such as scrolling UI or state) when the overall view for a [SemanticZoom](isemanticzoominformation.md) is about to change.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.initializeviewchange
     */
    InitializeViewChange() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Changes related aspects of presentation (such as scrolling UI or state) when the overall view for a [SemanticZoom](isemanticzoominformation.md) changes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.completeviewchange
     */
    CompleteViewChange() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Forces content in the view to scroll until the item specified by [SemanticZoomLocation](semanticzoomlocation.md) is visible. Also focuses that item if found.
     * @param {SemanticZoomLocation} item The item in the view to scroll to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.makevisible
     */
    MakeVisible(item) {
        result := ComCall(14, this, "ptr", item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes item-wise operations related to a view change when the implementing view is the source view and the pending destination view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.startviewchangefrom
     */
    StartViewChangeFrom(source, destination) {
        result := ComCall(15, this, "ptr", source, "ptr", destination, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes item-wise operations related to a view change when the source view is a different view and the pending destination view is the implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.startviewchangeto
     */
    StartViewChangeTo(source, destination) {
        result := ComCall(16, this, "ptr", source, "ptr", destination, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes item-wise operations related to a view change when the implementing view is the source view and the new view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.completeviewchangefrom
     */
    CompleteViewChangeFrom(source, destination) {
        result := ComCall(17, this, "ptr", source, "ptr", destination, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes item-wise operations related to a view change when the implementing view is the destination view and the source view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation.completeviewchangeto
     */
    CompleteViewChangeTo(source, destination) {
        result := ComCall(18, this, "ptr", source, "ptr", destination, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
