#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\KeyTime.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IKeyTimeHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyTimeHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{7fa2612c-22a9-45e9-9af7-c7416efff7a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromTimeSpan"]

    /**
     * 
     * @param {TimeSpan} timeSpan_ 
     * @returns {KeyTime} 
     */
    FromTimeSpan(timeSpan_) {
        result_ := KeyTime()
        result := ComCall(6, this, "ptr", timeSpan_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
