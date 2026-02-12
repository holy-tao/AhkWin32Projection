#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
#Include .\TargetedContentFile.ahk
#Include .\TargetedContentImage.ahk
#Include .\TargetedContentAction.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class ITargetedContentValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetedContentValue
     * @type {Guid}
     */
    static IID => Guid("{aafde4b3-4215-4bf8-867f-43f04865f9bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ValueKind", "get_Path", "get_String", "get_Uri", "get_Number", "get_Boolean", "get_File", "get_ImageFile", "get_Action", "get_Strings", "get_Uris", "get_Numbers", "get_Booleans", "get_Files", "get_ImageFiles", "get_Actions"]

    /**
     * @type {Integer} 
     */
    ValueKind {
        get => this.get_ValueKind()
    }

    /**
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {HSTRING} 
     */
    String {
        get => this.get_String()
    }

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {Float} 
     */
    Number {
        get => this.get_Number()
    }

    /**
     * @type {Boolean} 
     */
    Boolean {
        get => this.get_Boolean()
    }

    /**
     * @type {TargetedContentFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * @type {TargetedContentImage} 
     */
    ImageFile {
        get => this.get_ImageFile()
    }

    /**
     * @type {TargetedContentAction} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Strings {
        get => this.get_Strings()
    }

    /**
     * @type {IVectorView<Uri>} 
     */
    Uris {
        get => this.get_Uris()
    }

    /**
     * @type {IVectorView<Float>} 
     */
    Numbers {
        get => this.get_Numbers()
    }

    /**
     * @type {IVectorView<Boolean>} 
     */
    Booleans {
        get => this.get_Booleans()
    }

    /**
     * @type {IVectorView<TargetedContentFile>} 
     */
    Files {
        get => this.get_Files()
    }

    /**
     * @type {IVectorView<TargetedContentImage>} 
     */
    ImageFiles {
        get => this.get_ImageFiles()
    }

    /**
     * @type {IVectorView<TargetedContentAction>} 
     */
    Actions {
        get => this.get_Actions()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ValueKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_String() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Number() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Boolean() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TargetedContentFile} 
     */
    get_File() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TargetedContentFile(value)
    }

    /**
     * 
     * @returns {TargetedContentImage} 
     */
    get_ImageFile() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TargetedContentImage(value)
    }

    /**
     * 
     * @returns {TargetedContentAction} 
     */
    get_Action() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TargetedContentAction(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Strings() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_Uris() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Uri, value)
    }

    /**
     * 
     * @returns {IVectorView<Float>} 
     */
    get_Numbers() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IVectorView<Boolean>} 
     */
    get_Booleans() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentFile>} 
     */
    get_Files() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(TargetedContentFile, value)
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentImage>} 
     */
    get_ImageFiles() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(TargetedContentImage, value)
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentAction>} 
     */
    get_Actions() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(TargetedContentAction, value)
    }
}
