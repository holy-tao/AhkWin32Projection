#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaSourceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSourceStatics2
     * @type {Guid}
     */
    static IID => Guid("{eee161a4-7f13-4896-b8cb-df0de5bcb9f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromMediaBinder"]

    /**
     * 
     * @param {MediaBinder} binder 
     * @returns {MediaSource} 
     */
    CreateFromMediaBinder(binder) {
        result := ComCall(6, this, "ptr", binder, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(result_)
    }
}
