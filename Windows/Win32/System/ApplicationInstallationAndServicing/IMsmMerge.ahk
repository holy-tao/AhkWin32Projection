#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMsmErrors.ahk
#Include .\IMsmDependencies.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmMerge interface and the IMsmMerge2 interface provide interfaces to the Merge object.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmmerge
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmMerge extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenDatabase", "OpenModule", "CloseDatabase", "CloseModule", "OpenLog", "CloseLog", "Log", "get_Errors", "get_Dependencies", "Merge", "Connect", "ExtractCAB", "ExtractFiles"]

    /**
     * @type {IMsmErrors} 
     */
    Errors {
        get => this.get_Errors()
    }

    /**
     * @type {IMsmDependencies} 
     */
    Dependencies {
        get => this.get_Dependencies()
    }

    /**
     * 
     * @param {BSTR} Path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-opendatabase
     */
    OpenDatabase(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(7, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Path 
     * @param {Integer} Language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-openmodule
     */
    OpenModule(Path, Language) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(8, this, "ptr", Path, "short", Language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Commit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-closedatabase
     */
    CloseDatabase(Commit) {
        result := ComCall(9, this, "short", Commit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-closemodule
     */
    CloseModule() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-openlog
     */
    OpenLog(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(11, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-closelog
     */
    CloseLog() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Message 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-log
     */
    Log(Message) {
        Message := Message is String ? BSTR.Alloc(Message).Value : Message

        result := ComCall(13, this, "ptr", Message, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMsmErrors} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-get_errors
     */
    get_Errors() {
        result := ComCall(14, this, "ptr*", &Errors := 0, "HRESULT")
        return IMsmErrors(Errors)
    }

    /**
     * 
     * @returns {IMsmDependencies} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-get_dependencies
     */
    get_Dependencies() {
        result := ComCall(15, this, "ptr*", &Dependencies := 0, "HRESULT")
        return IMsmDependencies(Dependencies)
    }

    /**
     * 
     * @param {BSTR} Feature 
     * @param {BSTR} RedirectDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-merge
     */
    Merge(Feature, RedirectDir) {
        Feature := Feature is String ? BSTR.Alloc(Feature).Value : Feature
        RedirectDir := RedirectDir is String ? BSTR.Alloc(RedirectDir).Value : RedirectDir

        result := ComCall(16, this, "ptr", Feature, "ptr", RedirectDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Feature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-connect
     */
    Connect(Feature) {
        Feature := Feature is String ? BSTR.Alloc(Feature).Value : Feature

        result := ComCall(17, this, "ptr", Feature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-extractcab
     */
    ExtractCAB(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(18, this, "ptr", FileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmmerge-extractfiles
     */
    ExtractFiles(Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(19, this, "ptr", Path, "HRESULT")
        return result
    }
}
