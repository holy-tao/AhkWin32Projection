#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\ResourceDictionary.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IResourceDictionary extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceDictionary
     * @type {Guid}
     */
    static IID => Guid("{c1ea4f24-d6de-4191-8e3a-f48601f7489c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "put_Source", "get_MergedDictionaries", "get_ThemeDictionaries"]

    /**
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {IVector<ResourceDictionary>} 
     */
    MergedDictionaries {
        get => this.get_MergedDictionaries()
    }

    /**
     * @type {IMap<IInspectable, IInspectable>} 
     */
    ThemeDictionaries {
        get => this.get_ThemeDictionaries()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<ResourceDictionary>} 
     */
    get_MergedDictionaries() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ResourceDictionary, value)
    }

    /**
     * 
     * @returns {IMap<IInspectable, IInspectable>} 
     */
    get_ThemeDictionaries() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap(IInspectable, IInspectable, value)
    }
}
