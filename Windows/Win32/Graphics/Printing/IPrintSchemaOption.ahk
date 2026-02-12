#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IPrintSchemaDisplayableElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaOption extends IPrintSchemaDisplayableElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaOption
     * @type {Guid}
     */
    static IID => Guid("{66bb2f51-5844-4997-8d70-4b7cc221cf92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Selected", "get_Constrained", "GetPropertyValue"]

    /**
     * @type {BOOL} 
     */
    Selected {
        get => this.get_Selected()
    }

    /**
     * @type {Integer} 
     */
    Constrained {
        get => this.get_Constrained()
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_Selected() {
        result := ComCall(11, this, "int*", &pbIsSelected := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsSelected
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Constrained() {
        result := ComCall(12, this, "int*", &pSetting := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSetting
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IUnknown} 
     */
    GetPropertyValue(bstrName, bstrNamespaceUri) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrNamespaceUri is String) {
            pin := BSTR.Alloc(bstrNamespaceUri)
            bstrNamespaceUri := pin.Value
        }

        result := ComCall(13, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", &ppXmlValueNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppXmlValueNode)
    }
}
