#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXsltProcessor.ahk
#Include .\IXsltProcessor2.ahk
#Include .\IXsltProcessorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the methods needed by the Xslt processor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.xsl.xsltprocessor
 * @namespace Windows.Data.Xml.Xsl
 * @version WindowsRuntime 1.4
 */
class XsltProcessor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXsltProcessor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXsltProcessor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [XsltProcessor](xsltprocessor.md) object from the document provided.
     * @param {XmlDocument} document_ The XSLT to process.
     * @returns {XsltProcessor} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.xsl.xsltprocessor.#ctor
     */
    static CreateInstance(document_) {
        if (!XsltProcessor.HasProp("__IXsltProcessorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Data.Xml.Xsl.XsltProcessor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXsltProcessorFactory.IID)
            XsltProcessor.__IXsltProcessorFactory := IXsltProcessorFactory(factoryPtr)
        }

        return XsltProcessor.__IXsltProcessorFactory.CreateInstance(document_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Processes a node and its children and returns the resulting string transformation.
     * @param {IXmlNode} inputNode The node to process.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.xsl.xsltprocessor.transformtostring
     */
    TransformToString(inputNode) {
        if (!this.HasProp("__IXsltProcessor")) {
            if ((queryResult := this.QueryInterface(IXsltProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXsltProcessor := IXsltProcessor(outPtr)
        }

        return this.__IXsltProcessor.TransformToString(inputNode)
    }

    /**
     * Processes a node and its children and returns the resulting [XmlDocument](../windows.data.xml.dom/xmldocument.md).
     * @param {IXmlNode} inputNode The node to process.
     * @returns {XmlDocument} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.xsl.xsltprocessor.transformtodocument
     */
    TransformToDocument(inputNode) {
        if (!this.HasProp("__IXsltProcessor2")) {
            if ((queryResult := this.QueryInterface(IXsltProcessor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXsltProcessor2 := IXsltProcessor2(outPtr)
        }

        return this.__IXsltProcessor2.TransformToDocument(inputNode)
    }

;@endregion Instance Methods
}
