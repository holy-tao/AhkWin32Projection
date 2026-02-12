#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The INodeProperties interface retrieves text-only properties for a node.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nn-mmc-inodeproperties
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class INodeProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INodeProperties
     * @type {Guid}
     */
    static IID => Guid("{15bc4d24-a522-4406-aa55-0749537a6865}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty"]

    /**
     * The GetProperty method retrieves text-only property values for a node. Your implementation of the INodeProperties::GetProperty method is called when an application based on the MMC 2.0 Automation Object Model retrieves the Node.Property property.
     * @remarks
     * The Extended View extension uses two properties: CCF_DESCRIPTION and CCF_HTML_DETAILS. As an alternative to supplying values for these properties using the data object to query the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-description">CCF_DESCRIPTION</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-html-details">CCF_HTML_DETAILS</a> clipboard formats, a snap-in can use <b>INodeProperties::GetProperty</b> to return the property values to the Extended View. This alternative is beneficial in situations where a snap-in's data object does not provide the desired information.
     * 
     * In addition to providing CCF_DESCRIPTION and CCF_HTML_DETAILS property values, a snap-in can use 
     * INodeProperties to provide values for other text-based properties (for example, with a new view extension).
     * 
     * For more information and a code example for <b>INodeProperties::GetProperty</b>, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/using-the-extended-view-extension-implementation-details">Using the Extended View Extension - Implementation Details</a>.
     * @param {IDataObject} pDataObject A pointer to the snap-in data object.
     * @param {BSTR} szPropertyName The name of the property retrieved.
     * @returns {BSTR} Text value for the property.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-inodeproperties-getproperty
     */
    GetProperty(pDataObject, szPropertyName) {
        if(szPropertyName is String) {
            pin := BSTR.Alloc(szPropertyName)
            szPropertyName := pin.Value
        }

        pbstrProperty := BSTR()
        result := ComCall(3, this, "ptr", pDataObject, "ptr", szPropertyName, "ptr", pbstrProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrProperty
    }
}
