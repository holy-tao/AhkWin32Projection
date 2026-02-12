#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXmlDomImplementation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides methods that are independent of any particular instance of the document object model.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldomimplementation
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class XmlDomImplementation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXmlDomImplementation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXmlDomImplementation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates support for the specified feature.
     * @param {HSTRING} feature Specifies the feature to test. In Level 1, valid feature values are "XML", "DOM", and "MS-DOM" (case-insensitive).
     * @param {IInspectable} version_ Specifies the version number to test. If NULL, tests for implementation of the feature in any version. In Level 1, "1.0" is the valid version value.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.xmldomimplementation.hasfeature
     */
    HasFeature(feature, version_) {
        if (!this.HasProp("__IXmlDomImplementation")) {
            if ((queryResult := this.QueryInterface(IXmlDomImplementation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXmlDomImplementation := IXmlDomImplementation(outPtr)
        }

        return this.__IXmlDomImplementation.HasFeature(feature, version_)
    }

;@endregion Instance Methods
}
