#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISupportDoNotElevateServerActivation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISupportDoNotElevateServerActivation
     * @type {Guid}
     */
    static IID => Guid("{40aefe22-3ff6-43dc-8108-c8c402d57b5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
