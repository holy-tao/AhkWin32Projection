#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\WwwFormUrlDecoder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IWwwFormUrlDecoderRuntimeClassFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWwwFormUrlDecoderRuntimeClassFactory
     * @type {Guid}
     */
    static IID => Guid("{5b8c6b3d-24ae-41b5-a1bf-f0c3d544845b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWwwFormUrlDecoder"]

    /**
     * 
     * @param {HSTRING} query 
     * @returns {WwwFormUrlDecoder} 
     */
    CreateWwwFormUrlDecoder(query) {
        if(query is String) {
            pin := HSTRING.Create(query)
            query := pin.Value
        }
        query := query is Win32Handle ? NumGet(query, "ptr") : query

        result := ComCall(6, this, "ptr", query, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WwwFormUrlDecoder(instance)
    }
}
