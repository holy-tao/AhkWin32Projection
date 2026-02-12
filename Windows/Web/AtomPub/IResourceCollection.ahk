#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Syndication\ISyndicationText.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\Syndication\SyndicationCategory.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.AtomPub
 * @version WindowsRuntime 1.4
 */
class IResourceCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceCollection
     * @type {Guid}
     */
    static IID => Guid("{7f5fd609-bc88-41d4-88fa-3de6704d428e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title", "get_Uri", "get_Categories", "get_Accepts"]

    /**
     * @type {ISyndicationText} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {IVectorView<SyndicationCategory>} 
     */
    Categories {
        get => this.get_Categories()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Accepts {
        get => this.get_Accepts()
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Title() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISyndicationText(value)
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
     * @returns {IVectorView<SyndicationCategory>} 
     */
    get_Categories() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SyndicationCategory, value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Accepts() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
