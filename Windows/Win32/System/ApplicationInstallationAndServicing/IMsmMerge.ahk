#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmMerge interface and the IMsmMerge2 interface provide interfaces to the Merge object.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmmerge
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmMerge extends IDispatch{
    /**
     * The interface identifier for IMsmMerge
     * @type {Guid}
     */
    static IID => Guid("{0adda82e-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The class identifier for MsmMerge
     * @type {Guid}
     */
    static CLSID => Guid("{0adda830-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} Path 
     * @returns {HRESULT} 
     */
    OpenDatabase(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(7, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Path 
     * @param {Integer} Language 
     * @returns {HRESULT} 
     */
    OpenModule(Path, Language) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(8, this, "ptr", Path, "short", Language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Commit 
     * @returns {HRESULT} 
     */
    CloseDatabase(Commit) {
        result := ComCall(9, this, "short", Commit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseModule() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Path 
     * @returns {HRESULT} 
     */
    OpenLog(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(11, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseLog() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Message 
     * @returns {HRESULT} 
     */
    Log(Message) {
        Message := Message is String ? BSTR.Alloc(Message).Value : Message

        result := ComCall(13, this, "ptr", Message, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMsmErrors>} Errors 
     * @returns {HRESULT} 
     */
    get_Errors(Errors) {
        result := ComCall(14, this, "ptr", Errors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMsmDependencies>} Dependencies 
     * @returns {HRESULT} 
     */
    get_Dependencies(Dependencies) {
        result := ComCall(15, this, "ptr", Dependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Feature 
     * @param {BSTR} RedirectDir 
     * @returns {HRESULT} 
     */
    Merge(Feature, RedirectDir) {
        Feature := Feature is String ? BSTR.Alloc(Feature).Value : Feature
        RedirectDir := RedirectDir is String ? BSTR.Alloc(RedirectDir).Value : RedirectDir

        result := ComCall(16, this, "ptr", Feature, "ptr", RedirectDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Feature 
     * @returns {HRESULT} 
     */
    Connect(Feature) {
        Feature := Feature is String ? BSTR.Alloc(Feature).Value : Feature

        result := ComCall(17, this, "ptr", Feature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @returns {HRESULT} 
     */
    ExtractCAB(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(18, this, "ptr", FileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Path 
     * @returns {HRESULT} 
     */
    ExtractFiles(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(19, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
