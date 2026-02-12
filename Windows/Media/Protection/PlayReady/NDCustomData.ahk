#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INDCustomData.ahk
#Include .\INDCustomDataFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the custom data for one of the following PlayReady-ND messages: Registration Challenge, Registration Response, License Fetch Challenge, or License Fetch Response.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndcustomdata
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDCustomData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INDCustomData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INDCustomData.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} customDataTypeIDBytes_length 
     * @param {Pointer<Integer>} customDataTypeIDBytes 
     * @param {Integer} customDataBytes_length 
     * @param {Pointer<Integer>} customDataBytes 
     * @returns {NDCustomData} 
     */
    static CreateInstance(customDataTypeIDBytes_length, customDataTypeIDBytes, customDataBytes_length, customDataBytes) {
        if (!NDCustomData.HasProp("__INDCustomDataFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.NDCustomData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INDCustomDataFactory.IID)
            NDCustomData.__INDCustomDataFactory := INDCustomDataFactory(factoryPtr)
        }

        return NDCustomData.__INDCustomDataFactory.CreateInstance(customDataTypeIDBytes_length, customDataTypeIDBytes, customDataBytes_length, customDataBytes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the 16-byte type identifier for the custom data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndcustomdata.customdatatypeid
     */
    CustomDataTypeID {
        get => this.get_CustomDataTypeID()
    }

    /**
     * Gets the custom data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndcustomdata.customdata
     */
    CustomData {
        get => this.get_CustomData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Pointer<Pointer>} customDataTypeIDBytes 
     * @returns {HRESULT} 
     */
    get_CustomDataTypeID(customDataTypeIDBytes) {
        if (!this.HasProp("__INDCustomData")) {
            if ((queryResult := this.QueryInterface(INDCustomData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDCustomData := INDCustomData(outPtr)
        }

        return this.__INDCustomData.get_CustomDataTypeID(customDataTypeIDBytes)
    }

    /**
     * 
     * @param {Pointer<Pointer>} customDataBytes 
     * @returns {HRESULT} 
     */
    get_CustomData(customDataBytes) {
        if (!this.HasProp("__INDCustomData")) {
            if ((queryResult := this.QueryInterface(INDCustomData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDCustomData := INDCustomData(outPtr)
        }

        return this.__INDCustomData.get_CustomData(customDataBytes)
    }

;@endregion Instance Methods
}
