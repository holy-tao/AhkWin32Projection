#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\HttpMapTileDataSource.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IHttpMapTileDataSourceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMapTileDataSourceFactory
     * @type {Guid}
     */
    static IID => Guid("{53b4b107-84dc-4291-89f8-6d0bb612a055}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateInstanceWithUriFormatString"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {HttpMapTileDataSource} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMapTileDataSource(value)
    }

    /**
     * 
     * @param {HSTRING} uriFormatString 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {HttpMapTileDataSource} 
     */
    CreateInstanceWithUriFormatString(uriFormatString, baseInterface, innerInterface) {
        if(uriFormatString is String) {
            pin := HSTRING.Create(uriFormatString)
            uriFormatString := pin.Value
        }
        uriFormatString := uriFormatString is Win32Handle ? NumGet(uriFormatString, "ptr") : uriFormatString

        result := ComCall(7, this, "ptr", uriFormatString, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMapTileDataSource(value)
    }
}
