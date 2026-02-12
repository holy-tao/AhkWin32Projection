#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppAttributeValue.ahk
#Include .\IIppAttributeValueStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an attribute value as defined by the [Internet Printing Protocol (IPP) specification](https://tools.ietf.org/html/rfc8011). This class provides static methods you can use to create an **IppAttributeValue** object that represents an instance of the specified attribute name and has the specified value(s), and static methods you can use to get values you have created.
 * @remarks
 * For more information about this class, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppAttributeValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIppAttributeValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIppAttributeValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that represents an `unsupported` attribute, as defined by the Internet Printing Protocol (IPP).
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createunsupported
     */
    static CreateUnsupported() {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateUnsupported()
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that represents an `unknown` attribute, as defined by the Internet Printing Protocol (IPP).
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createunknown
     */
    static CreateUnknown() {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateUnknown()
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that represents a `no-value` attribute, as defined by the Internet Printing Protocol (IPP).
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createnovalue
     */
    static CreateNoValue() {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateNoValue()
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an `integer` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {Integer} value The value of the `integer` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createinteger
     */
    static CreateInteger(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateInteger(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `integer` attributes with the specified values.
     * @param {IIterable<Integer>} values The values of the array of `integer` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createintegerarray
     */
    static CreateIntegerArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateIntegerArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `boolean` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {Boolean} value The value of the `boolean` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createboolean
     */
    static CreateBoolean(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateBoolean(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `boolean` attributes with the specified values.
     * @param {IIterable<Boolean>} values The values of the array of `boolean` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createbooleanarray
     */
    static CreateBooleanArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateBooleanArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an `enum` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {Integer} value The value of the `enum` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createenum
     */
    static CreateEnum(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateEnum(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `enum` attributes with the specified values.
     * @param {IIterable<Integer>} values The values of the array of `enum` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createenumarray
     */
    static CreateEnumArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateEnumArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `octetString` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {IBuffer} value The value of the `octetString` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createoctetstring
     */
    static CreateOctetString(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateOctetString(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `octetString` attributes with the specified values.
     * @param {IIterable<IBuffer>} values The values of the array of `octetString` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createoctetstringarray
     */
    static CreateOctetStringArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateOctetStringArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `dateTime` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {DateTime} value The value of the `dateTime` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createdatetime
     */
    static CreateDateTime(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateDateTime(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `dateTime` attributes with the specified values.
     * @param {IIterable<DateTime>} values The values of the array of `dateTime` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createdatetimearray
     */
    static CreateDateTimeArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateDateTimeArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `resolution` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {IppResolution} value The value of the `resolution` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createresolution
     */
    static CreateResolution(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateResolution(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `resolution` attributes with the specified values.
     * @param {IIterable<IppResolution>} values The values of the array of `resolution` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createresolutionarray
     */
    static CreateResolutionArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateResolutionArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `rangeOfInteger` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {IppIntegerRange} value The value of the `rangeOfInteger` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createrangeofinteger
     */
    static CreateRangeOfInteger(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateRangeOfInteger(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `rangeOfInteger` attributes with the specified values.
     * @param {IIterable<IppIntegerRange>} values The values of the array of `rangeOfInteger` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createrangeofintegerarray
     */
    static CreateRangeOfIntegerArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateRangeOfIntegerArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `collection` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} memberAttributes The value of the `collection` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createcollection
     */
    static CreateCollection(memberAttributes) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateCollection(memberAttributes)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `collection` attributes with the specified values.
     * @param {IIterable<IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>>} memberAttributesArray The values of the array of `collection` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createcollectionarray
     */
    static CreateCollectionArray(memberAttributesArray) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateCollectionArray(memberAttributesArray)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `textWithLanguage` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {IppTextWithLanguage} value The value of the `textWithLanguage` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createtextwithlanguage
     */
    static CreateTextWithLanguage(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateTextWithLanguage(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `textWithLanguage` attributes with the specified values.
     * @param {IIterable<IppTextWithLanguage>} values The values of the array of `textWithLanguage` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createtextwithlanguagearray
     */
    static CreateTextWithLanguageArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateTextWithLanguageArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `createNameWithLanguage` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {IppTextWithLanguage} value The value of the `createNameWithLanguage` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createnamewithlanguage
     */
    static CreateNameWithLanguage(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateNameWithLanguage(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `createNameWithLanguage` attributes with the specified values.
     * @param {IIterable<IppTextWithLanguage>} values The values of the array of `createNameWithLanguage` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createnamewithlanguagearray
     */
    static CreateNameWithLanguageArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateNameWithLanguageArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `textWithoutLanguage` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {HSTRING} value The value of the `textWithoutLanguage` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createtextwithoutlanguage
     */
    static CreateTextWithoutLanguage(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateTextWithoutLanguage(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `textWithoutLanguage` attributes with the specified values.
     * @param {IIterable<HSTRING>} values The values of the array of `textWithoutLanguage` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createtextwithoutlanguagearray
     */
    static CreateTextWithoutLanguageArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateTextWithoutLanguageArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `nameWithoutLanguage` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {HSTRING} value The value of the `nameWithoutLanguage` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createnamewithoutlanguage
     */
    static CreateNameWithoutLanguage(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateNameWithoutLanguage(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `nameWithoutLanguage` attributes with the specified values.
     * @param {IIterable<HSTRING>} values The values of the array of `nameWithoutLanguage` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createnamewithoutlanguagearray
     */
    static CreateNameWithoutLanguageArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateNameWithoutLanguageArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `keyword` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {HSTRING} value The value of the `keyword` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createkeyword
     */
    static CreateKeyword(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateKeyword(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `keyword` attributes with the specified values.
     * @param {IIterable<HSTRING>} values The values of the array of `keyword` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createkeywordarray
     */
    static CreateKeywordArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateKeywordArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `uri` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {Uri} value The value of the `uri` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createuri
     */
    static CreateUri(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateUri(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `uri` attributes with the specified values.
     * @param {IIterable<Uri>} values The values of the array of `uri` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createuriarray
     */
    static CreateUriArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateUriArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `uriScheme` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {HSTRING} value The value of the `uriScheme` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createurischema
     */
    static CreateUriSchema(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateUriSchema(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `uriScheme` attributes with the specified values.
     * @param {IIterable<HSTRING>} values The values of the array of `uriScheme` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createurischemaarray
     */
    static CreateUriSchemaArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateUriSchemaArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `charset` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {HSTRING} value The value of the `charset` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createcharset
     */
    static CreateCharset(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateCharset(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `charset` attributes with the specified values.
     * @param {IIterable<HSTRING>} values The values of the array of `charset` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createcharsetarray
     */
    static CreateCharsetArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateCharsetArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `naturalLanguage` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {HSTRING} value The value of the `naturalLanguage` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createnaturallanguage
     */
    static CreateNaturalLanguage(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateNaturalLanguage(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `naturalLanguage` attributes with the specified values.
     * @param {IIterable<HSTRING>} values The values of the array of `naturalLanguage` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createnaturallanguagearray
     */
    static CreateNaturalLanguageArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateNaturalLanguageArray(values)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains a `mimeMediaType` attribute with the specified value, as defined by the Internet Printing Protocol (IPP).
     * @param {HSTRING} value The value of the `mimeMediaType` attribute.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createmimemedia
     */
    static CreateMimeMedia(value) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateMimeMedia(value)
    }

    /**
     * Creates an [IppAttributeValue](ippattributevalue.md) object that contains an array of `mimeMediaType` attributes with the specified values.
     * @param {IIterable<HSTRING>} values The values of the array of `mimeMediaType` attributes.
     * @returns {IppAttributeValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.createmimemediaarray
     */
    static CreateMimeMediaArray(values) {
        if (!IppAttributeValue.HasProp("__IIppAttributeValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppAttributeValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppAttributeValueStatics.IID)
            IppAttributeValue.__IIppAttributeValueStatics := IIppAttributeValueStatics(factoryPtr)
        }

        return IppAttributeValue.__IIppAttributeValueStatics.CreateMimeMediaArray(values)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates the type of attribute that is represented by this [IppAttributeValue](ippattributevalue.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.get_Kind()
    }

    /**
     * Gets the array of `integer` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getintegerarray
     */
    GetIntegerArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetIntegerArray()
    }

    /**
     * Gets the array of `boolean` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getbooleanarray
     */
    GetBooleanArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetBooleanArray()
    }

    /**
     * Gets the array of `enum` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getenumarray
     */
    GetEnumArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetEnumArray()
    }

    /**
     * Gets the array of `octetString` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getoctetstringarray
     */
    GetOctetStringArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetOctetStringArray()
    }

    /**
     * Gets the array of `dateTime` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<DateTime>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getdatetimearray
     */
    GetDateTimeArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetDateTimeArray()
    }

    /**
     * Gets the array of `resolution` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<IppResolution>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getresolutionarray
     */
    GetResolutionArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetResolutionArray()
    }

    /**
     * Gets the array of `rangeOfInteger` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<IppIntegerRange>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getrangeofintegerarray
     */
    GetRangeOfIntegerArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetRangeOfIntegerArray()
    }

    /**
     * Gets the array of `collection` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<IMapView<HSTRING, IppAttributeValue>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getcollectionarray
     */
    GetCollectionArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetCollectionArray()
    }

    /**
     * Gets the array of `textWithLanguage` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<IppTextWithLanguage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.gettextwithlanguagearray
     */
    GetTextWithLanguageArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetTextWithLanguageArray()
    }

    /**
     * Gets the array of `nameWithLanguage` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<IppTextWithLanguage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getnamewithlanguagearray
     */
    GetNameWithLanguageArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetNameWithLanguageArray()
    }

    /**
     * Gets the array of `textWithoutLanguage` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.gettextwithoutlanguagearray
     */
    GetTextWithoutLanguageArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetTextWithoutLanguageArray()
    }

    /**
     * Gets the array of `nameWithoutLanguage` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getnamewithoutlanguagearray
     */
    GetNameWithoutLanguageArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetNameWithoutLanguageArray()
    }

    /**
     * Gets the array of `keyword` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getkeywordarray
     */
    GetKeywordArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetKeywordArray()
    }

    /**
     * Gets the array of `uri` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<Uri>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.geturiarray
     */
    GetUriArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetUriArray()
    }

    /**
     * Gets the array of `uriScheme` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.geturischemaarray
     */
    GetUriSchemaArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetUriSchemaArray()
    }

    /**
     * Gets the array of `charset` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getcharsetarray
     */
    GetCharsetArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetCharsetArray()
    }

    /**
     * Gets the array of `naturalLanguage` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getnaturallanguagearray
     */
    GetNaturalLanguageArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetNaturalLanguageArray()
    }

    /**
     * Gets the array of `mimeMediaType` attributes that are contained in the current [IppAttributeValue](ippattributevalue.md) object.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributevalue.getmimemediatypearray
     */
    GetMimeMediaTypeArray() {
        if (!this.HasProp("__IIppAttributeValue")) {
            if ((queryResult := this.QueryInterface(IIppAttributeValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppAttributeValue := IIppAttributeValue(outPtr)
        }

        return this.__IIppAttributeValue.GetMimeMediaTypeArray()
    }

;@endregion Instance Methods
}
