#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines an instance of a property.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmproperty
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmProperty
     * @type {Guid}
     */
    static IID => Guid("{4a73fee4-4102-4fcc-9ffb-38614f9ee768}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Value", "get_Sources", "get_PropertyFlags"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Sources {
        get => this.get_Sources()
    }

    /**
     * @type {Integer} 
     */
    PropertyFlags {
        get => this.get_PropertyFlags()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmproperty-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmproperty-get_value
     */
    get_Value() {
        value := BSTR()
        result := ComCall(8, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmproperty-get_sources
     */
    get_Sources() {
        result := ComCall(9, this, "ptr*", &sources := 0, "HRESULT")
        return sources
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmproperty-get_propertyflags
     */
    get_PropertyFlags() {
        result := ComCall(10, this, "int*", &flags := 0, "HRESULT")
        return flags
    }
}
