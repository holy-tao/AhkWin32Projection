#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\IndexedResourceQualifier.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class IIndexedResourceCandidate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIndexedResourceCandidate
     * @type {Guid}
     */
    static IID => Guid("{0e619ef3-faec-4414-a9d7-54acd5953f29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Uri", "get_Metadata", "get_Qualifiers", "get_ValueAsString", "GetQualifierValue"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Metadata {
        get => this.get_Metadata()
    }

    /**
     * @type {IVectorView<IndexedResourceQualifier>} 
     */
    Qualifiers {
        get => this.get_Qualifiers()
    }

    /**
     * @type {HSTRING} 
     */
    ValueAsString {
        get => this.get_ValueAsString()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Metadata() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<IndexedResourceQualifier>} 
     */
    get_Qualifiers() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IndexedResourceQualifier, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ValueAsString() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} qualifierName 
     * @returns {HSTRING} 
     */
    GetQualifierValue(qualifierName) {
        if(qualifierName is String) {
            pin := HSTRING.Create(qualifierName)
            qualifierName := pin.Value
        }
        qualifierName := qualifierName is Win32Handle ? NumGet(qualifierName, "ptr") : qualifierName

        qualifierValue := HSTRING()
        result := ComCall(11, this, "ptr", qualifierName, "ptr", qualifierValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return qualifierValue
    }
}
