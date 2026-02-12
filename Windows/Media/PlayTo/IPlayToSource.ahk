#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PlayToConnection.ahk
#Include .\PlayToSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates an instance of the PlayToSource object.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. The CLSID is <b>CLSID_PlayToSourceClassFactory</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfsharingengine/nn-mfsharingengine-iplaytosourceclassfactory
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class IPlayToSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToSource
     * @type {Guid}
     */
    static IID => Guid("{7f138a08-fbb7-4b09-8356-aa5f4e335c31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Connection", "get_Next", "put_Next", "PlayNext"]

    /**
     * @type {PlayToConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * @type {PlayToSource} 
     */
    Next {
        get => this.get_Next()
        set => this.put_Next(value)
    }

    /**
     * 
     * @returns {PlayToConnection} 
     */
    get_Connection() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayToConnection(value)
    }

    /**
     * 
     * @returns {PlayToSource} 
     */
    get_Next() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayToSource(value)
    }

    /**
     * 
     * @param {PlayToSource} value 
     * @returns {HRESULT} 
     */
    put_Next(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PlayNextChapter method starts playback from the next chapter in the current title.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playnextchapter-method
     */
    PlayNext() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
