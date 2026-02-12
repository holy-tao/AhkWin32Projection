#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IVp9ProfileIdsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVp9ProfileIdsStatics
     * @type {Guid}
     */
    static IID => Guid("{20311a55-fe06-5883-92d9-6080c97743e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Profile0ChromaSubsampling420BitDepth8", "get_Profile2ChromaSubsampling420BitDepth10", "get_Profile2ChromaSubsampling420BitDepth12"]

    /**
     * @type {Integer} 
     */
    Profile0ChromaSubsampling420BitDepth8 {
        get => this.get_Profile0ChromaSubsampling420BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    Profile2ChromaSubsampling420BitDepth10 {
        get => this.get_Profile2ChromaSubsampling420BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    Profile2ChromaSubsampling420BitDepth12 {
        get => this.get_Profile2ChromaSubsampling420BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Profile0ChromaSubsampling420BitDepth8() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Profile2ChromaSubsampling420BitDepth10() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Profile2ChromaSubsampling420BitDepth12() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
