#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ICodecSubtypesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICodecSubtypesStatics2
     * @type {Guid}
     */
    static IID => Guid("{363b0930-de26-582e-8014-f546d0753887}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoFormatAv1"]

    /**
     * @type {HSTRING} 
     */
    VideoFormatAv1 {
        get => this.get_VideoFormatAv1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoFormatAv1() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
