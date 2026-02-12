#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\TargetedContentValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\TargetedContentCollection.ahk
#Include .\TargetedContentItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class ITargetedContentCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetedContentCollection
     * @type {Guid}
     */
    static IID => Guid("{2d4b66c5-f163-44ba-9f6e-e1a4c2bb559d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "ReportInteraction", "ReportCustomInteraction", "get_Path", "get_Properties", "get_Collections", "get_Items"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IMapView<HSTRING, TargetedContentValue>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {IVectorView<TargetedContentCollection>} 
     */
    Collections {
        get => this.get_Collections()
    }

    /**
     * @type {IVectorView<TargetedContentItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} interaction 
     * @returns {HRESULT} 
     */
    ReportInteraction(interaction) {
        result := ComCall(7, this, "int", interaction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} customInteractionName 
     * @returns {HRESULT} 
     */
    ReportCustomInteraction(customInteractionName) {
        if(customInteractionName is String) {
            pin := HSTRING.Create(customInteractionName)
            customInteractionName := pin.Value
        }
        customInteractionName := customInteractionName is Win32Handle ? NumGet(customInteractionName, "ptr") : customInteractionName

        result := ComCall(8, this, "ptr", customInteractionName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, TargetedContentValue>} 
     */
    get_Properties() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), TargetedContentValue, value)
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentCollection>} 
     */
    get_Collections() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(TargetedContentCollection, value)
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentItem>} 
     */
    get_Items() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(TargetedContentItem, value)
    }
}
