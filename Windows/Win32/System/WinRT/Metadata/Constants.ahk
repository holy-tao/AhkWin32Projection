#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global INVALID_CONNECTION_ID := 0

/**
 * @type {Integer (UInt32)}
 */
export global INVALID_TASK_ID := 0

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CONNECTION_NAME := 260

/**
 * @type {String}
 */
export global MAIN_CLR_MODULE_NAME_W := "coreclr"

/**
 * @type {String}
 */
export global MAIN_CLR_MODULE_NAME_A := "coreclr"

/**
 * @type {String}
 */
export global MSCOREE_SHIM_W := "mscoree.dll"

/**
 * @type {String}
 */
export global MSCOREE_SHIM_A := "mscoree.dll"

/**
 * @type {String}
 */
export global COR_NATIVE_LINK_CUSTOM_VALUE := "COMPLUS_NativeLink"

/**
 * @type {String}
 */
export global COR_NATIVE_LINK_CUSTOM_VALUE_ANSI := "COMPLUS_NativeLink"

/**
 * @type {Integer (UInt32)}
 */
export global COR_NATIVE_LINK_CUSTOM_VALUE_CC := 18

/**
 * @type {String}
 */
export global COR_BASE_SECURITY_ATTRIBUTE_CLASS := "System.Security.Permissions.SecurityAttribute"

/**
 * @type {String}
 */
export global COR_BASE_SECURITY_ATTRIBUTE_CLASS_ANSI := "System.Security.Permissions.SecurityAttribute"

/**
 * @type {String}
 */
export global COR_SUPPRESS_UNMANAGED_CODE_CHECK_ATTRIBUTE := "System.Security.SuppressUnmanagedCodeSecurityAttribute"

/**
 * @type {String}
 */
export global COR_SUPPRESS_UNMANAGED_CODE_CHECK_ATTRIBUTE_ANSI := "System.Security.SuppressUnmanagedCodeSecurityAttribute"

/**
 * @type {String}
 */
export global COR_UNVER_CODE_ATTRIBUTE := "System.Security.UnverifiableCodeAttribute"

/**
 * @type {String}
 */
export global COR_UNVER_CODE_ATTRIBUTE_ANSI := "System.Security.UnverifiableCodeAttribute"

/**
 * @type {String}
 */
export global COR_REQUIRES_SECOBJ_ATTRIBUTE := "System.Security.DynamicSecurityMethodAttribute"

/**
 * @type {String}
 */
export global COR_REQUIRES_SECOBJ_ATTRIBUTE_ANSI := "System.Security.DynamicSecurityMethodAttribute"

/**
 * @type {String}
 */
export global COR_COMPILERSERVICE_DISCARDABLEATTRIBUTE := "System.Runtime.CompilerServices.DiscardableAttribute"

/**
 * @type {String}
 */
export global COR_COMPILERSERVICE_DISCARDABLEATTRIBUTE_ASNI := "System.Runtime.CompilerServices.DiscardableAttribute"

/**
 * @type {Integer (Int32)}
 */
export global COR_E_UNAUTHORIZEDACCESS := -2147024891

/**
 * @type {Integer (Int32)}
 */
export global COR_E_ARGUMENT := -2147024809

/**
 * @type {Integer (Int32)}
 */
export global COR_E_INVALIDCAST := -2147467262

/**
 * @type {Integer (Int32)}
 */
export global COR_E_OUTOFMEMORY := -2147024882

/**
 * @type {Integer (Int32)}
 */
export global COR_E_NULLREFERENCE := -2147467261

/**
 * @type {Integer (Int32)}
 */
export global COR_E_AMBIGUOUSMATCH := -2147475171

/**
 * @type {Integer (Int32)}
 */
export global COR_E_TARGETPARAMCOUNT := -2147352562

/**
 * @type {Integer (Int32)}
 */
export global COR_E_DIVIDEBYZERO := -2147352558

/**
 * @type {Integer (Int32)}
 */
export global COR_E_BADIMAGEFORMAT := -2147024885

/**
 * @type {String}
 */
export global FRAMEWORK_REGISTRY_KEY := "Software\Microsoft\.NETFramework"

/**
 * @type {String}
 */
export global FRAMEWORK_REGISTRY_KEY_W := "Software\Microsoft\.NETFramework"

/**
 * @type {String}
 */
export global USER_FRAMEWORK_REGISTRY_KEY := "Software\Microsoft\.NETFramework64"

/**
 * @type {String}
 */
export global USER_FRAMEWORK_REGISTRY_KEY_W := "Software\Microsoft\.NETFramework64"

/**
 * @type {String}
 */
export global COR_CTOR_METHOD_NAME := ".ctor"

/**
 * @type {String}
 */
export global COR_CTOR_METHOD_NAME_W := ".ctor"

/**
 * @type {String}
 */
export global COR_CCTOR_METHOD_NAME := ".cctor"

/**
 * @type {String}
 */
export global COR_CCTOR_METHOD_NAME_W := ".cctor"

/**
 * @type {String}
 */
export global COR_ENUM_FIELD_NAME := "value__"

/**
 * @type {String}
 */
export global COR_ENUM_FIELD_NAME_W := "value__"

/**
 * @type {String}
 */
export global COR_DELETED_NAME_A := "_Deleted"

/**
 * @type {String}
 */
export global COR_DELETED_NAME_W := "_Deleted"

/**
 * @type {String}
 */
export global COR_VTABLEGAP_NAME_A := "_VtblGap"

/**
 * @type {String}
 */
export global COR_VTABLEGAP_NAME_W := "_VtblGap"

/**
 * @type {String}
 */
export global INTEROP_DISPID_TYPE_W := "System.Runtime.InteropServices.DispIdAttribute"

/**
 * @type {String}
 */
export global INTEROP_DISPID_TYPE := "System.Runtime.InteropServices.DispIdAttribute"

/**
 * @type {String}
 */
export global INTEROP_INTERFACETYPE_TYPE_W := "System.Runtime.InteropServices.InterfaceTypeAttribute"

/**
 * @type {String}
 */
export global INTEROP_INTERFACETYPE_TYPE := "System.Runtime.InteropServices.InterfaceTypeAttribute"

/**
 * @type {String}
 */
export global INTEROP_CLASSINTERFACE_TYPE_W := "System.Runtime.InteropServices.ClassInterfaceAttribute"

/**
 * @type {String}
 */
export global INTEROP_CLASSINTERFACE_TYPE := "System.Runtime.InteropServices.ClassInterfaceAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMVISIBLE_TYPE_W := "System.Runtime.InteropServices.ComVisibleAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMVISIBLE_TYPE := "System.Runtime.InteropServices.ComVisibleAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMREGISTERFUNCTION_TYPE_W := "System.Runtime.InteropServices.ComRegisterFunctionAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMREGISTERFUNCTION_TYPE := "System.Runtime.InteropServices.ComRegisterFunctionAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMUNREGISTERFUNCTION_TYPE_W := "System.Runtime.InteropServices.ComUnregisterFunctionAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMUNREGISTERFUNCTION_TYPE := "System.Runtime.InteropServices.ComUnregisterFunctionAttribute"

/**
 * @type {String}
 */
export global INTEROP_IMPORTEDFROMTYPELIB_TYPE_W := "System.Runtime.InteropServices.ImportedFromTypeLibAttribute"

/**
 * @type {String}
 */
export global INTEROP_IMPORTEDFROMTYPELIB_TYPE := "System.Runtime.InteropServices.ImportedFromTypeLibAttribute"

/**
 * @type {String}
 */
export global INTEROP_PRIMARYINTEROPASSEMBLY_TYPE_W := "System.Runtime.InteropServices.PrimaryInteropAssemblyAttribute"

/**
 * @type {String}
 */
export global INTEROP_PRIMARYINTEROPASSEMBLY_TYPE := "System.Runtime.InteropServices.PrimaryInteropAssemblyAttribute"

/**
 * @type {String}
 */
export global INTEROP_IDISPATCHIMPL_TYPE_W := "System.Runtime.InteropServices.IDispatchImplAttribute"

/**
 * @type {String}
 */
export global INTEROP_IDISPATCHIMPL_TYPE := "System.Runtime.InteropServices.IDispatchImplAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMSOURCEINTERFACES_TYPE_W := "System.Runtime.InteropServices.ComSourceInterfacesAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMSOURCEINTERFACES_TYPE := "System.Runtime.InteropServices.ComSourceInterfacesAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMDEFAULTINTERFACE_TYPE_W := "System.Runtime.InteropServices.ComDefaultInterfaceAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMDEFAULTINTERFACE_TYPE := "System.Runtime.InteropServices.ComDefaultInterfaceAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMCONVERSIONLOSS_TYPE_W := "System.Runtime.InteropServices.ComConversionLossAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMCONVERSIONLOSS_TYPE := "System.Runtime.InteropServices.ComConversionLossAttribute"

/**
 * @type {String}
 */
export global INTEROP_BESTFITMAPPING_TYPE_W := "System.Runtime.InteropServices.BestFitMappingAttribute"

/**
 * @type {String}
 */
export global INTEROP_BESTFITMAPPING_TYPE := "System.Runtime.InteropServices.BestFitMappingAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBTYPE_TYPE_W := "System.Runtime.InteropServices.TypeLibTypeAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBTYPE_TYPE := "System.Runtime.InteropServices.TypeLibTypeAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBFUNC_TYPE_W := "System.Runtime.InteropServices.TypeLibFuncAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBFUNC_TYPE := "System.Runtime.InteropServices.TypeLibFuncAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBVAR_TYPE_W := "System.Runtime.InteropServices.TypeLibVarAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBVAR_TYPE := "System.Runtime.InteropServices.TypeLibVarAttribute"

/**
 * @type {String}
 */
export global INTEROP_MARSHALAS_TYPE_W := "System.Runtime.InteropServices.MarshalAsAttribute"

/**
 * @type {String}
 */
export global INTEROP_MARSHALAS_TYPE := "System.Runtime.InteropServices.MarshalAsAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMIMPORT_TYPE_W := "System.Runtime.InteropServices.ComImportAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMIMPORT_TYPE := "System.Runtime.InteropServices.ComImportAttribute"

/**
 * @type {String}
 */
export global INTEROP_GUID_TYPE_W := "System.Runtime.InteropServices.GuidAttribute"

/**
 * @type {String}
 */
export global INTEROP_GUID_TYPE := "System.Runtime.InteropServices.GuidAttribute"

/**
 * @type {String}
 */
export global INTEROP_DEFAULTMEMBER_TYPE_W := "System.Reflection.DefaultMemberAttribute"

/**
 * @type {String}
 */
export global INTEROP_DEFAULTMEMBER_TYPE := "System.Reflection.DefaultMemberAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMEMULATE_TYPE_W := "System.Runtime.InteropServices.ComEmulateAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMEMULATE_TYPE := "System.Runtime.InteropServices.ComEmulateAttribute"

/**
 * @type {String}
 */
export global INTEROP_PRESERVESIG_TYPE_W := "System.Runtime.InteropServices.PreserveSigAttribure"

/**
 * @type {String}
 */
export global INTEROP_PRESERVESIG_TYPE := "System.Runtime.InteropServices.PreserveSigAttribure"

/**
 * @type {String}
 */
export global INTEROP_IN_TYPE_W := "System.Runtime.InteropServices.InAttribute"

/**
 * @type {String}
 */
export global INTEROP_IN_TYPE := "System.Runtime.InteropServices.InAttribute"

/**
 * @type {String}
 */
export global INTEROP_OUT_TYPE_W := "System.Runtime.InteropServices.OutAttribute"

/**
 * @type {String}
 */
export global INTEROP_OUT_TYPE := "System.Runtime.InteropServices.OutAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMALIASNAME_TYPE_W := "System.Runtime.InteropServices.ComAliasNameAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMALIASNAME_TYPE := "System.Runtime.InteropServices.ComAliasNameAttribute"

/**
 * @type {String}
 */
export global INTEROP_PARAMARRAY_TYPE_W := "System.ParamArrayAttribute"

/**
 * @type {String}
 */
export global INTEROP_PARAMARRAY_TYPE := "System.ParamArrayAttribute"

/**
 * @type {String}
 */
export global INTEROP_LCIDCONVERSION_TYPE_W := "System.Runtime.InteropServices.LCIDConversionAttribute"

/**
 * @type {String}
 */
export global INTEROP_LCIDCONVERSION_TYPE := "System.Runtime.InteropServices.LCIDConversionAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMSUBSTITUTABLEINTERFACE_TYPE_W := "System.Runtime.InteropServices.ComSubstitutableInterfaceAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMSUBSTITUTABLEINTERFACE_TYPE := "System.Runtime.InteropServices.ComSubstitutableInterfaceAttribute"

/**
 * @type {String}
 */
export global INTEROP_DECIMALVALUE_TYPE_W := "System.Runtime.CompilerServices.DecimalConstantAttribute"

/**
 * @type {String}
 */
export global INTEROP_DECIMALVALUE_TYPE := "System.Runtime.CompilerServices.DecimalConstantAttribute"

/**
 * @type {String}
 */
export global INTEROP_DATETIMEVALUE_TYPE_W := "System.Runtime.CompilerServices.DateTimeConstantAttribute"

/**
 * @type {String}
 */
export global INTEROP_DATETIMEVALUE_TYPE := "System.Runtime.CompilerServices.DateTimeConstantAttribute"

/**
 * @type {String}
 */
export global INTEROP_IUNKNOWNVALUE_TYPE_W := "System.Runtime.CompilerServices.IUnknownConstantAttribute"

/**
 * @type {String}
 */
export global INTEROP_IUNKNOWNVALUE_TYPE := "System.Runtime.CompilerServices.IUnknownConstantAttribute"

/**
 * @type {String}
 */
export global INTEROP_IDISPATCHVALUE_TYPE_W := "System.Runtime.CompilerServices.IDispatchConstantAttribute"

/**
 * @type {String}
 */
export global INTEROP_IDISPATCHVALUE_TYPE := "System.Runtime.CompilerServices.IDispatchConstantAttribute"

/**
 * @type {String}
 */
export global INTEROP_AUTOPROXY_TYPE_W := "System.Runtime.InteropServices.AutomationProxyAttribute"

/**
 * @type {String}
 */
export global INTEROP_AUTOPROXY_TYPE := "System.Runtime.InteropServices.AutomationProxyAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBIMPORTCLASS_TYPE_W := "System.Runtime.InteropServices.TypeLibImportClassAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBIMPORTCLASS_TYPE := "System.Runtime.InteropServices.TypeLibImportClassAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBVERSION_TYPE_W := "System.Runtime.InteropServices.TypeLibVersionAttribute"

/**
 * @type {String}
 */
export global INTEROP_TYPELIBVERSION_TYPE := "System.Runtime.InteropServices.TypeLibVersionAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMCOMPATIBLEVERSION_TYPE_W := "System.Runtime.InteropServices.ComCompatibleVersionAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMCOMPATIBLEVERSION_TYPE := "System.Runtime.InteropServices.ComCompatibleVersionAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMEVENTINTERFACE_TYPE_W := "System.Runtime.InteropServices.ComEventInterfaceAttribute"

/**
 * @type {String}
 */
export global INTEROP_COMEVENTINTERFACE_TYPE := "System.Runtime.InteropServices.ComEventInterfaceAttribute"

/**
 * @type {String}
 */
export global INTEROP_COCLASS_TYPE_W := "System.Runtime.InteropServices.CoClassAttribute"

/**
 * @type {String}
 */
export global INTEROP_COCLASS_TYPE := "System.Runtime.InteropServices.CoClassAttribute"

/**
 * @type {String}
 */
export global INTEROP_SERIALIZABLE_TYPE_W := "System.SerializableAttribute"

/**
 * @type {String}
 */
export global INTEROP_SERIALIZABLE_TYPE := "System.SerializableAttribute"

/**
 * @type {String}
 */
export global INTEROP_SETWIN32CONTEXTINIDISPATCHATTRIBUTE_TYPE_W := "System.Runtime.InteropServices.SetWin32ContextInIDispatchAttribute"

/**
 * @type {String}
 */
export global INTEROP_SETWIN32CONTEXTINIDISPATCHATTRIBUTE_TYPE := "System.Runtime.InteropServices.SetWin32ContextInIDispatchAttribute"

/**
 * @type {String}
 */
export global FORWARD_INTEROP_STUB_METHOD_TYPE_W := "System.Runtime.InteropServices.ManagedToNativeComInteropStubAttribute"

/**
 * @type {String}
 */
export global FORWARD_INTEROP_STUB_METHOD_TYPE := "System.Runtime.InteropServices.ManagedToNativeComInteropStubAttribute"

/**
 * @type {String}
 */
export global FRIEND_ASSEMBLY_TYPE_W := "System.Runtime.CompilerServices.InternalsVisibleToAttribute"

/**
 * @type {String}
 */
export global FRIEND_ASSEMBLY_TYPE := "System.Runtime.CompilerServices.InternalsVisibleToAttribute"

/**
 * @type {String}
 */
export global FRIEND_ACCESS_ALLOWED_ATTRIBUTE_TYPE_W := "System.Runtime.CompilerServices.FriendAccessAllowedAttribute"

/**
 * @type {String}
 */
export global FRIEND_ACCESS_ALLOWED_ATTRIBUTE_TYPE := "System.Runtime.CompilerServices.FriendAccessAllowedAttribute"

/**
 * @type {String}
 */
export global SUBJECT_ASSEMBLY_TYPE_W := "System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute"

/**
 * @type {String}
 */
export global SUBJECT_ASSEMBLY_TYPE := "System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute"

/**
 * @type {String}
 */
export global DISABLED_PRIVATE_REFLECTION_TYPE_W := "System.Runtime.CompilerServices.DisablePrivateReflectionAttribute"

/**
 * @type {String}
 */
export global DISABLED_PRIVATE_REFLECTION_TYPE := "System.Runtime.CompilerServices.DisablePrivateReflectionAttribute"

/**
 * @type {String}
 */
export global DEFAULTDOMAIN_STA_TYPE_W := "System.STAThreadAttribute"

/**
 * @type {String}
 */
export global DEFAULTDOMAIN_STA_TYPE := "System.STAThreadAttribute"

/**
 * @type {String}
 */
export global DEFAULTDOMAIN_MTA_TYPE_W := "System.MTAThreadAttribute"

/**
 * @type {String}
 */
export global DEFAULTDOMAIN_MTA_TYPE := "System.MTAThreadAttribute"

/**
 * @type {String}
 */
export global DEFAULTDOMAIN_LOADEROPTIMIZATION_TYPE_W := "System.LoaderOptimizationAttribute"

/**
 * @type {String}
 */
export global DEFAULTDOMAIN_LOADEROPTIMIZATION_TYPE := "System.LoaderOptimizationAttribute"

/**
 * @type {String}
 */
export global NONVERSIONABLE_TYPE_W := "System.Runtime.Versioning.NonVersionableAttribute"

/**
 * @type {String}
 */
export global NONVERSIONABLE_TYPE := "System.Runtime.Versioning.NonVersionableAttribute"

/**
 * @type {String}
 */
export global COMPILATIONRELAXATIONS_TYPE_W := "System.Runtime.CompilerServices.CompilationRelaxationsAttribute"

/**
 * @type {String}
 */
export global COMPILATIONRELAXATIONS_TYPE := "System.Runtime.CompilerServices.CompilationRelaxationsAttribute"

/**
 * @type {String}
 */
export global RUNTIMECOMPATIBILITY_TYPE_W := "System.Runtime.CompilerServices.RuntimeCompatibilityAttribute"

/**
 * @type {String}
 */
export global RUNTIMECOMPATIBILITY_TYPE := "System.Runtime.CompilerServices.RuntimeCompatibilityAttribute"

/**
 * @type {String}
 */
export global DEFAULTDEPENDENCY_TYPE_W := "System.Runtime.CompilerServices.DefaultDependencyAttribute"

/**
 * @type {String}
 */
export global DEFAULTDEPENDENCY_TYPE := "System.Runtime.CompilerServices.DefaultDependencyAttribute"

/**
 * @type {String}
 */
export global DEPENDENCY_TYPE_W := "System.Runtime.CompilerServices.DependencyAttribute"

/**
 * @type {String}
 */
export global DEPENDENCY_TYPE := "System.Runtime.CompilerServices.DependencyAttribute"

/**
 * @type {String}
 */
export global TARGET_FRAMEWORK_TYPE_W := "System.Runtime.Versioning.TargetFrameworkAttribute"

/**
 * @type {String}
 */
export global TARGET_FRAMEWORK_TYPE := "System.Runtime.Versioning.TargetFrameworkAttribute"

/**
 * @type {String}
 */
export global ASSEMBLY_METADATA_TYPE_W := "System.Reflection.AssemblyMetadataAttribute"

/**
 * @type {String}
 */
export global ASSEMBLY_METADATA_TYPE := "System.Reflection.AssemblyMetadataAttribute"

/**
 * @type {String}
 */
export global CMOD_CALLCONV_NAMESPACE_OLD := "System.Runtime.InteropServices"

/**
 * @type {String}
 */
export global CMOD_CALLCONV_NAMESPACE := "System.Runtime.CompilerServices"

/**
 * @type {String}
 */
export global CMOD_CALLCONV_NAME_CDECL := "CallConvCdecl"

/**
 * @type {String}
 */
export global CMOD_CALLCONV_NAME_STDCALL := "CallConvStdcall"

/**
 * @type {String}
 */
export global CMOD_CALLCONV_NAME_THISCALL := "CallConvThiscall"

/**
 * @type {String}
 */
export global CMOD_CALLCONV_NAME_FASTCALL := "CallConvFastcall"

/**
 * @type {Guid}
 */
export global LIBID_ComPlusRuntime := Guid("{bed7f4ea-1a96-11d2-8f08-00a0c9a6186d}")

/**
 * @type {Guid}
 */
export global GUID_ExportedFromComPlus := Guid("{90883f05-3d28-11d2-8f17-00a0c9a6186d}")

/**
 * @type {Guid}
 */
export global GUID_ManagedName := Guid("{0f21f359-ab84-41e8-9a78-36d110e6d2f9}")

/**
 * @type {Guid}
 */
export global GUID_Function2Getter := Guid("{54fc8f55-38de-4703-9c4e-250351302b1c}")

/**
 * @type {Guid}
 */
export global CLSID_CorMetaDataDispenserRuntime := Guid("{1ec2de53-75cc-11d2-9775-00a0c9b4d50c}")

/**
 * @type {Guid}
 */
export global GUID_DispIdOverride := Guid("{cd2bc5c9-f452-4326-b714-f9c539d4da58}")

/**
 * @type {Guid}
 */
export global GUID_ForceIEnumerable := Guid("{b64784eb-d8d4-4d9b-9acd-0e30806426f7}")

/**
 * @type {Guid}
 */
export global GUID_PropGetCA := Guid("{2941ff83-88d8-4f73-b6a9-bdf8712d000d}")

/**
 * @type {Guid}
 */
export global GUID_PropPutCA := Guid("{29533527-3683-4364-abc0-db1add822fa2}")

/**
 * @type {Guid}
 */
export global CLSID_CLR_v1_MetaData := Guid("{005023ca-72b1-11d3-9fc4-00c04f79a0a3}")

/**
 * @type {Guid}
 */
export global CLSID_CLR_v2_MetaData := Guid("{efea471a-44fd-4862-9292-0c58d46e1f3a}")

/**
 * @type {Guid}
 */
export global MetaDataCheckDuplicatesFor := Guid("{30fe7be8-d7d9-11d2-9f80-00c04f79a0a3}")

/**
 * @type {Guid}
 */
export global MetaDataRefToDefCheck := Guid("{de3856f8-d7d9-11d2-9f80-00c04f79a0a3}")

/**
 * @type {Guid}
 */
export global MetaDataNotificationForTokenMovement := Guid("{e5d71a4c-d7da-11d2-9f80-00c04f79a0a3}")

/**
 * @type {Guid}
 */
export global MetaDataSetUpdate := Guid("{2eee315c-d7db-11d2-9f80-00c04f79a0a3}")

/**
 * @type {Guid}
 */
export global MetaDataImportOption := Guid("{79700f36-4aac-11d3-84c3-009027868cb1}")

/**
 * @type {Guid}
 */
export global MetaDataThreadSafetyOptions := Guid("{f7559806-f266-42ea-8c63-0adb45e8b234}")

/**
 * @type {Guid}
 */
export global MetaDataErrorIfEmitOutOfOrder := Guid("{1547872d-dc03-11d2-9420-0000f8083460}")

/**
 * @type {Guid}
 */
export global MetaDataGenerateTCEAdapters := Guid("{dcc9de90-4151-11d3-88d6-00902754c43a}")

/**
 * @type {Guid}
 */
export global MetaDataTypeLibImportNamespace := Guid("{f17ff889-5a63-11d3-9ff2-00c04ff7431a}")

/**
 * @type {Guid}
 */
export global MetaDataLinkerOptions := Guid("{47e099b6-ae7c-4797-8317-b48aa645b8f9}")

/**
 * @type {Guid}
 */
export global MetaDataRuntimeVersion := Guid("{47e099b7-ae7c-4797-8317-b48aa645b8f9}")

/**
 * @type {Guid}
 */
export global MetaDataMergerOptions := Guid("{132d3a6e-b35d-464e-951a-42efb9fb6601}")

/**
 * @type {Guid}
 */
export global MetaDataPreserveLocalRefs := Guid("{a55c0354-e91b-468b-8648-7cc31035d533}")

/**
 * @type {Integer (Int32)}
 */
export global DESCR_GROUP_METHODDEF := 0

/**
 * @type {Integer (Int32)}
 */
export global DESCR_GROUP_METHODIMPL := 1

/**
 * @type {Guid}
 */
export global CLSID_Cor := Guid("{bee00010-ee77-11d0-a015-00c04fbbb884}")

/**
 * @type {Guid}
 */
export global CLSID_CorMetaDataDispenser := Guid("{e5cb7a31-7512-11d2-89ce-0080c792e5d8}")

/**
 * @type {Guid}
 */
export global CLSID_CorMetaDataDispenserReg := Guid("{435755ff-7397-11d2-9771-00a0c9b4d50c}")

/**
 * @type {Guid}
 */
export global CLSID_CorMetaDataReg := Guid("{87f3a1f5-7397-11d2-9771-00a0c9b4d50c}")

/**
 * @type {Integer (Int32)}
 */
export global SIGN_MASK_ONEBYTE := -64

/**
 * @type {Integer (Int32)}
 */
export global SIGN_MASK_TWOBYTE := -8192

/**
 * @type {Integer (Int32)}
 */
export global SIGN_MASK_FOURBYTE := -268435456
;@endregion Constants
