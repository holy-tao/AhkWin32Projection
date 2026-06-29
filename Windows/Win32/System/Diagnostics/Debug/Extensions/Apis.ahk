#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\IDebugHost.ahk" { IDebugHost }
#Import ".\IDataModelManager.ahk" { IDataModelManager }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */

;@region Functions
/**
 * 
 * @param {PSTR} RemoteOptions 
 * @param {Pointer<Guid>} InterfaceId 
 * @returns {Pointer<Void>} 
 */
export DebugConnect(RemoteOptions, InterfaceId) {
    RemoteOptions := RemoteOptions is String ? StrPtr(RemoteOptions) : RemoteOptions

    result := DllCall("dbgeng.dll\DebugConnect", "ptr", RemoteOptions, Guid.Ptr, InterfaceId, "ptr*", &_Interface := 0, "HRESULT")
    return _Interface
}

/**
 * 
 * @param {PWSTR} RemoteOptions 
 * @param {Pointer<Guid>} InterfaceId 
 * @returns {Pointer<Void>} 
 */
export DebugConnectWide(RemoteOptions, InterfaceId) {
    RemoteOptions := RemoteOptions is String ? StrPtr(RemoteOptions) : RemoteOptions

    result := DllCall("dbgeng.dll\DebugConnectWide", "ptr", RemoteOptions, Guid.Ptr, InterfaceId, "ptr*", &_Interface := 0, "HRESULT")
    return _Interface
}

/**
 * 
 * @param {Pointer<Guid>} InterfaceId 
 * @returns {Pointer<Void>} 
 */
export DebugCreate(InterfaceId) {
    result := DllCall("dbgeng.dll\DebugCreate", Guid.Ptr, InterfaceId, "ptr*", &_Interface := 0, "HRESULT")
    return _Interface
}

/**
 * 
 * @param {Pointer<Guid>} InterfaceId 
 * @param {Integer} DbgEngOptions 
 * @returns {Pointer<Void>} 
 */
export DebugCreateEx(InterfaceId, DbgEngOptions) {
    result := DllCall("dbgeng.dll\DebugCreateEx", Guid.Ptr, InterfaceId, "uint", DbgEngOptions, "ptr*", &_Interface := 0, "HRESULT")
    return _Interface
}

/**
 * 
 * @param {IDebugHost} debugHost 
 * @returns {IDataModelManager} 
 */
export CreateDataModelManager(debugHost) {
    result := DllCall("dbgmodel.dll\CreateDataModelManager", "ptr", debugHost, "ptr*", &manager := 0, "HRESULT")
    return IDataModelManager(manager)
}

;@endregion Functions
