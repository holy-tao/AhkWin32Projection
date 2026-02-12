#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWebWizardHost extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebWizardHost
     * @type {Guid}
     */
    static IID => Guid("{18bcc359-4990-4bfb-b951-3c83702be5f9}")

    /**
     * The class identifier for WebWizardHost
     * @type {Guid}
     */
    static CLSID => Guid("{c827f149-55c1-4d28-935e-57e47caed973}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FinalBack", "FinalNext", "Cancel", "put_Caption", "get_Caption", "put_Property", "get_Property", "SetWizardButtons", "SetHeaderText"]

    /**
     * @type {BSTR} 
     */
    Caption {
        get => this.get_Caption()
        set => this.put_Caption(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FinalBack() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FinalNext() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    Cancel() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCaption 
     * @returns {HRESULT} 
     */
    put_Caption(bstrCaption) {
        if(bstrCaption is String) {
            pin := BSTR.Alloc(bstrCaption)
            bstrCaption := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrCaption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Caption() {
        pbstrCaption := BSTR()
        result := ComCall(11, this, "ptr", pbstrCaption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrCaption
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} pvProperty 
     * @returns {HRESULT} 
     */
    put_Property(bstrPropertyName, pvProperty) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrPropertyName, "ptr", pvProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {VARIANT} 
     */
    get_Property(bstrPropertyName) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        pvProperty := VARIANT()
        result := ComCall(13, this, "ptr", bstrPropertyName, "ptr", pvProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvProperty
    }

    /**
     * 
     * @param {VARIANT_BOOL} vfEnableBack 
     * @param {VARIANT_BOOL} vfEnableNext 
     * @param {VARIANT_BOOL} vfLastPage 
     * @returns {HRESULT} 
     */
    SetWizardButtons(vfEnableBack, vfEnableNext, vfLastPage) {
        result := ComCall(14, this, "short", vfEnableBack, "short", vfEnableNext, "short", vfLastPage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrHeaderTitle 
     * @param {BSTR} bstrHeaderSubtitle 
     * @returns {HRESULT} 
     */
    SetHeaderText(bstrHeaderTitle, bstrHeaderSubtitle) {
        if(bstrHeaderTitle is String) {
            pin := BSTR.Alloc(bstrHeaderTitle)
            bstrHeaderTitle := pin.Value
        }
        if(bstrHeaderSubtitle is String) {
            pin := BSTR.Alloc(bstrHeaderSubtitle)
            bstrHeaderSubtitle := pin.Value
        }

        result := ComCall(15, this, "ptr", bstrHeaderTitle, "ptr", bstrHeaderSubtitle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
