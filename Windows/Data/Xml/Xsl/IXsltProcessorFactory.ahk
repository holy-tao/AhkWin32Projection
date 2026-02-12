#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XsltProcessor.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Xsl
 * @version WindowsRuntime 1.4
 */
class IXsltProcessorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXsltProcessorFactory
     * @type {Guid}
     */
    static IID => Guid("{274146c0-9a51-4663-bf30-0ef742146f20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {XmlDocument} document_ 
     * @returns {XsltProcessor} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(document_) {
        result := ComCall(6, this, "ptr", document_, "ptr*", &xsltProcessor_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XsltProcessor(xsltProcessor_)
    }
}
