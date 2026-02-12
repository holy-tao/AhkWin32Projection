#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationViewTransferContext.ahk
#Include .\IApplicationViewTransferContextStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about a window drag operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtransfercontext
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewTransferContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationViewTransferContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationViewTransferContext.IID

    /**
     * Gets the format ID of the [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) for the drag operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtransfercontext.datapackageformatid
     * @type {HSTRING} 
     */
    static DataPackageFormatId {
        get => ApplicationViewTransferContext.get_DataPackageFormatId()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DataPackageFormatId() {
        if (!ApplicationViewTransferContext.HasProp("__IApplicationViewTransferContextStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewTransferContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewTransferContextStatics.IID)
            ApplicationViewTransferContext.__IApplicationViewTransferContextStatics := IApplicationViewTransferContextStatics(factoryPtr)
        }

        return ApplicationViewTransferContext.__IApplicationViewTransferContextStatics.get_DataPackageFormatId()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the ID of the application view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewtransfercontext.viewid
     * @type {Integer} 
     */
    ViewId {
        get => this.get_ViewId()
        set => this.put_ViewId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ApplicationViewTransferContext](applicationviewtransfercontext.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewTransferContext")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewId() {
        if (!this.HasProp("__IApplicationViewTransferContext")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTransferContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTransferContext := IApplicationViewTransferContext(outPtr)
        }

        return this.__IApplicationViewTransferContext.get_ViewId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ViewId(value) {
        if (!this.HasProp("__IApplicationViewTransferContext")) {
            if ((queryResult := this.QueryInterface(IApplicationViewTransferContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewTransferContext := IApplicationViewTransferContext(outPtr)
        }

        return this.__IApplicationViewTransferContext.put_ViewId(value)
    }

;@endregion Instance Methods
}
