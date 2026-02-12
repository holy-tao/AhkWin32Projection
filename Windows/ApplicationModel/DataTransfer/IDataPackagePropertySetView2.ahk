#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\UI\Color.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackagePropertySetView2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackagePropertySetView2
     * @type {Guid}
     */
    static IID => Guid("{6054509b-8ebe-4feb-9c1e-75e69de54b84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PackageFamilyName", "get_ContentSourceWebLink", "get_ContentSourceApplicationLink", "get_Square30x30Logo", "get_LogoBackgroundColor"]

    /**
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * @type {Uri} 
     */
    ContentSourceWebLink {
        get => this.get_ContentSourceWebLink()
    }

    /**
     * @type {Uri} 
     */
    ContentSourceApplicationLink {
        get => this.get_ContentSourceApplicationLink()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Square30x30Logo {
        get => this.get_Square30x30Logo()
    }

    /**
     * @type {Color} 
     */
    LogoBackgroundColor {
        get => this.get_LogoBackgroundColor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentSourceWebLink() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentSourceApplicationLink() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Square30x30Logo() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LogoBackgroundColor() {
        value := Color()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
