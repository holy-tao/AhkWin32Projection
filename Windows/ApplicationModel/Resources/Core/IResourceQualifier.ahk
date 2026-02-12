#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceQualifier extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceQualifier
     * @type {Guid}
     */
    static IID => Guid("{785da5b2-4afd-4376-a888-c5f9a6b7a05c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QualifierName", "get_QualifierValue", "get_IsDefault", "get_IsMatch", "get_Score"]

    /**
     * @type {HSTRING} 
     */
    QualifierName {
        get => this.get_QualifierName()
    }

    /**
     * @type {HSTRING} 
     */
    QualifierValue {
        get => this.get_QualifierValue()
    }

    /**
     * @type {Boolean} 
     */
    IsDefault {
        get => this.get_IsDefault()
    }

    /**
     * @type {Boolean} 
     */
    IsMatch {
        get => this.get_IsMatch()
    }

    /**
     * @type {Float} 
     */
    Score {
        get => this.get_Score()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QualifierName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QualifierValue() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDefault() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMatch() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Score() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
