#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaOption.ahk
#Include .\IPrintSchemaDisplayableElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaFeature extends IPrintSchemaDisplayableElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaFeature
     * @type {Guid}
     */
    static IID => Guid("{ef189461-5d62-4626-8e57-ff83583c4826}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedOption", "put_SelectedOption", "get_SelectionType", "GetOption", "get_DisplayUI"]

    /**
     * @type {IPrintSchemaOption} 
     */
    SelectedOption {
        get => this.get_SelectedOption()
        set => this.put_SelectedOption(value)
    }

    /**
     * @type {Integer} 
     */
    SelectionType {
        get => this.get_SelectionType()
    }

    /**
     * @type {BOOL} 
     */
    DisplayUI {
        get => this.get_DisplayUI()
    }

    /**
     * 
     * @returns {IPrintSchemaOption} 
     */
    get_SelectedOption() {
        result := ComCall(11, this, "ptr*", &ppOption := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @param {IPrintSchemaOption} pOption 
     * @returns {HRESULT} 
     */
    put_SelectedOption(pOption) {
        result := ComCall(12, this, "ptr", pOption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionType() {
        result := ComCall(13, this, "int*", &pSelectionType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSelectionType
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaOption} 
     */
    GetOption(bstrName, bstrNamespaceUri) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrNamespaceUri is String) {
            pin := BSTR.Alloc(bstrNamespaceUri)
            bstrNamespaceUri := pin.Value
        }

        result := ComCall(14, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", &ppOption := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_DisplayUI() {
        result := ComCall(15, this, "int*", &pbShow := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbShow
    }
}
