#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlLoadSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlLoadSettings
     * @type {Guid}
     */
    static IID => Guid("{58aa07a8-fed6-46f7-b4c5-fb1ba72108d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxElementDepth", "put_MaxElementDepth", "get_ProhibitDtd", "put_ProhibitDtd", "get_ResolveExternals", "put_ResolveExternals", "get_ValidateOnParse", "put_ValidateOnParse", "get_ElementContentWhiteSpace", "put_ElementContentWhiteSpace"]

    /**
     * @type {Integer} 
     */
    MaxElementDepth {
        get => this.get_MaxElementDepth()
        set => this.put_MaxElementDepth(value)
    }

    /**
     * @type {Boolean} 
     */
    ProhibitDtd {
        get => this.get_ProhibitDtd()
        set => this.put_ProhibitDtd(value)
    }

    /**
     * @type {Boolean} 
     */
    ResolveExternals {
        get => this.get_ResolveExternals()
        set => this.put_ResolveExternals(value)
    }

    /**
     * @type {Boolean} 
     */
    ValidateOnParse {
        get => this.get_ValidateOnParse()
        set => this.put_ValidateOnParse(value)
    }

    /**
     * @type {Boolean} 
     */
    ElementContentWhiteSpace {
        get => this.get_ElementContentWhiteSpace()
        set => this.put_ElementContentWhiteSpace(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxElementDepth() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxElementDepth(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ProhibitDtd() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ProhibitDtd(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ResolveExternals() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ResolveExternals(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ValidateOnParse() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ValidateOnParse(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ElementContentWhiteSpace() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ElementContentWhiteSpace(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
