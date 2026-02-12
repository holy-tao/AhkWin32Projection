#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISemanticZoomInformation.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Communicates the info needed for a view to serve as one of the two possible views ([ZoomedOutView](semanticzoom_zoomedoutview.md) or [ZoomedInView](semanticzoom_zoomedinview.md)) of a [SemanticZoom](semanticzoom.md).
 * @remarks
 * The ISemanticZoomInformation interface provides info for a single view of a [SemanticZoom](semanticzoom.md) control. However, it doesn't provide info to synchronize the two views of a [SemanticZoom](semanticzoom.md). The [ZoomedInView](semanticzoom_zoomedinview.md) and [ZoomedOutView](semanticzoom_zoomedoutview.md) should be synchronized, so if a user selects a group in the [ZoomedOutView](semanticzoom_zoomedoutview.md), the details of that group are shown in the [ZoomedInView](semanticzoom_zoomedinview.md). You can use a [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) or add code to synchronize the views. Any controls that you bind to the same [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) will always have the same current item. If both views use the same [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) as the their data source, the [CollectionViewSource](../windows.ui.xaml.data/collectionviewsource.md) will synchronize the views automatically. Otherwise, you can handle the [SemanticZoom.ViewChangeStarted](semanticzoom_viewchangestarted.md) event and synchronize the items in the event handler. See [SemanticZoom](semanticzoom.md) for more info.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.isemanticzoominformation
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISemanticZoom extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISemanticZoom
     * @type {Guid}
     */
    static IID => Guid("{019fff21-ece6-4fbc-bf40-8938d4813e27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ZoomedInView", "put_ZoomedInView", "get_ZoomedOutView", "put_ZoomedOutView", "get_IsZoomedInViewActive", "put_IsZoomedInViewActive", "get_CanChangeViews", "put_CanChangeViews", "add_ViewChangeStarted", "remove_ViewChangeStarted", "add_ViewChangeCompleted", "remove_ViewChangeCompleted", "ToggleActiveView", "get_IsZoomOutButtonEnabled", "put_IsZoomOutButtonEnabled"]

    /**
     * @type {ISemanticZoomInformation} 
     */
    ZoomedInView {
        get => this.get_ZoomedInView()
        set => this.put_ZoomedInView(value)
    }

    /**
     * @type {ISemanticZoomInformation} 
     */
    ZoomedOutView {
        get => this.get_ZoomedOutView()
        set => this.put_ZoomedOutView(value)
    }

    /**
     * @type {Boolean} 
     */
    IsZoomedInViewActive {
        get => this.get_IsZoomedInViewActive()
        set => this.put_IsZoomedInViewActive(value)
    }

    /**
     * @type {Boolean} 
     */
    CanChangeViews {
        get => this.get_CanChangeViews()
        set => this.put_CanChangeViews(value)
    }

    /**
     * @type {Boolean} 
     */
    IsZoomOutButtonEnabled {
        get => this.get_IsZoomOutButtonEnabled()
        set => this.put_IsZoomOutButtonEnabled(value)
    }

    /**
     * 
     * @returns {ISemanticZoomInformation} 
     */
    get_ZoomedInView() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISemanticZoomInformation(value)
    }

    /**
     * 
     * @param {ISemanticZoomInformation} value 
     * @returns {HRESULT} 
     */
    put_ZoomedInView(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISemanticZoomInformation} 
     */
    get_ZoomedOutView() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISemanticZoomInformation(value)
    }

    /**
     * 
     * @param {ISemanticZoomInformation} value 
     * @returns {HRESULT} 
     */
    put_ZoomedOutView(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomedInViewActive() {
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
    put_IsZoomedInViewActive(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanChangeViews() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_CanChangeViews(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SemanticZoomViewChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ViewChangeStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ViewChangeStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SemanticZoomViewChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ViewChangeCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ViewChangeCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ToggleActiveView() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomOutButtonEnabled() {
        result := ComCall(19, this, "int*", &value := 0, "int")
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
    put_IsZoomOutButtonEnabled(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
