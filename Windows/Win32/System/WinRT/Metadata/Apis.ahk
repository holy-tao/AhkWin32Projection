#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class Metadata {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_CONNECTION_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_TASK_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CONNECTION_NAME => 260

    /**
     * @type {String}
     */
    static MAIN_CLR_MODULE_NAME_W => "coreclr"

    /**
     * @type {String}
     */
    static MAIN_CLR_MODULE_NAME_A => "coreclr"

    /**
     * @type {String}
     */
    static MSCOREE_SHIM_W => "mscoree.dll"

    /**
     * @type {String}
     */
    static MSCOREE_SHIM_A => "mscoree.dll"

    /**
     * @type {String}
     */
    static COR_NATIVE_LINK_CUSTOM_VALUE => "COMPLUS_NativeLink"

    /**
     * @type {String}
     */
    static COR_NATIVE_LINK_CUSTOM_VALUE_ANSI => "COMPLUS_NativeLink"

    /**
     * @type {Integer (UInt32)}
     */
    static COR_NATIVE_LINK_CUSTOM_VALUE_CC => 18

    /**
     * @type {String}
     */
    static COR_BASE_SECURITY_ATTRIBUTE_CLASS => "System.Security.Permissions.SecurityAttribute"

    /**
     * @type {String}
     */
    static COR_BASE_SECURITY_ATTRIBUTE_CLASS_ANSI => "System.Security.Permissions.SecurityAttribute"

    /**
     * @type {String}
     */
    static COR_SUPPRESS_UNMANAGED_CODE_CHECK_ATTRIBUTE => "System.Security.SuppressUnmanagedCodeSecurityAttribute"

    /**
     * @type {String}
     */
    static COR_SUPPRESS_UNMANAGED_CODE_CHECK_ATTRIBUTE_ANSI => "System.Security.SuppressUnmanagedCodeSecurityAttribute"

    /**
     * @type {String}
     */
    static COR_UNVER_CODE_ATTRIBUTE => "System.Security.UnverifiableCodeAttribute"

    /**
     * @type {String}
     */
    static COR_UNVER_CODE_ATTRIBUTE_ANSI => "System.Security.UnverifiableCodeAttribute"

    /**
     * @type {String}
     */
    static COR_REQUIRES_SECOBJ_ATTRIBUTE => "System.Security.DynamicSecurityMethodAttribute"

    /**
     * @type {String}
     */
    static COR_REQUIRES_SECOBJ_ATTRIBUTE_ANSI => "System.Security.DynamicSecurityMethodAttribute"

    /**
     * @type {String}
     */
    static COR_COMPILERSERVICE_DISCARDABLEATTRIBUTE => "System.Runtime.CompilerServices.DiscardableAttribute"

    /**
     * @type {String}
     */
    static COR_COMPILERSERVICE_DISCARDABLEATTRIBUTE_ASNI => "System.Runtime.CompilerServices.DiscardableAttribute"

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_UNAUTHORIZEDACCESS => -2147024891

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_ARGUMENT => -2147024809

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_INVALIDCAST => -2147467262

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_OUTOFMEMORY => -2147024882

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_NULLREFERENCE => -2147467261

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_AMBIGUOUSMATCH => -2147475171

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_TARGETPARAMCOUNT => -2147352562

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_DIVIDEBYZERO => -2147352558

    /**
     * @type {Integer (Int32)}
     */
    static COR_E_BADIMAGEFORMAT => -2147024885

    /**
     * @type {String}
     */
    static FRAMEWORK_REGISTRY_KEY => "Software\Microsoft\.NETFramework"

    /**
     * @type {String}
     */
    static FRAMEWORK_REGISTRY_KEY_W => "Software\Microsoft\.NETFramework"

    /**
     * @type {String}
     */
    static USER_FRAMEWORK_REGISTRY_KEY => "Software\Microsoft\.NETFramework64"

    /**
     * @type {String}
     */
    static USER_FRAMEWORK_REGISTRY_KEY_W => "Software\Microsoft\.NETFramework64"

    /**
     * @type {String}
     */
    static COR_CTOR_METHOD_NAME => ".ctor"

    /**
     * @type {String}
     */
    static COR_CTOR_METHOD_NAME_W => ".ctor"

    /**
     * @type {String}
     */
    static COR_CCTOR_METHOD_NAME => ".cctor"

    /**
     * @type {String}
     */
    static COR_CCTOR_METHOD_NAME_W => ".cctor"

    /**
     * @type {String}
     */
    static COR_ENUM_FIELD_NAME => "value__"

    /**
     * @type {String}
     */
    static COR_ENUM_FIELD_NAME_W => "value__"

    /**
     * @type {String}
     */
    static COR_DELETED_NAME_A => "_Deleted"

    /**
     * @type {String}
     */
    static COR_DELETED_NAME_W => "_Deleted"

    /**
     * @type {String}
     */
    static COR_VTABLEGAP_NAME_A => "_VtblGap"

    /**
     * @type {String}
     */
    static COR_VTABLEGAP_NAME_W => "_VtblGap"

    /**
     * @type {String}
     */
    static INTEROP_DISPID_TYPE_W => "System.Runtime.InteropServices.DispIdAttribute"

    /**
     * @type {String}
     */
    static INTEROP_DISPID_TYPE => "System.Runtime.InteropServices.DispIdAttribute"

    /**
     * @type {String}
     */
    static INTEROP_INTERFACETYPE_TYPE_W => "System.Runtime.InteropServices.InterfaceTypeAttribute"

    /**
     * @type {String}
     */
    static INTEROP_INTERFACETYPE_TYPE => "System.Runtime.InteropServices.InterfaceTypeAttribute"

    /**
     * @type {String}
     */
    static INTEROP_CLASSINTERFACE_TYPE_W => "System.Runtime.InteropServices.ClassInterfaceAttribute"

    /**
     * @type {String}
     */
    static INTEROP_CLASSINTERFACE_TYPE => "System.Runtime.InteropServices.ClassInterfaceAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMVISIBLE_TYPE_W => "System.Runtime.InteropServices.ComVisibleAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMVISIBLE_TYPE => "System.Runtime.InteropServices.ComVisibleAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMREGISTERFUNCTION_TYPE_W => "System.Runtime.InteropServices.ComRegisterFunctionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMREGISTERFUNCTION_TYPE => "System.Runtime.InteropServices.ComRegisterFunctionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMUNREGISTERFUNCTION_TYPE_W => "System.Runtime.InteropServices.ComUnregisterFunctionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMUNREGISTERFUNCTION_TYPE => "System.Runtime.InteropServices.ComUnregisterFunctionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IMPORTEDFROMTYPELIB_TYPE_W => "System.Runtime.InteropServices.ImportedFromTypeLibAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IMPORTEDFROMTYPELIB_TYPE => "System.Runtime.InteropServices.ImportedFromTypeLibAttribute"

    /**
     * @type {String}
     */
    static INTEROP_PRIMARYINTEROPASSEMBLY_TYPE_W => "System.Runtime.InteropServices.PrimaryInteropAssemblyAttribute"

    /**
     * @type {String}
     */
    static INTEROP_PRIMARYINTEROPASSEMBLY_TYPE => "System.Runtime.InteropServices.PrimaryInteropAssemblyAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IDISPATCHIMPL_TYPE_W => "System.Runtime.InteropServices.IDispatchImplAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IDISPATCHIMPL_TYPE => "System.Runtime.InteropServices.IDispatchImplAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMSOURCEINTERFACES_TYPE_W => "System.Runtime.InteropServices.ComSourceInterfacesAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMSOURCEINTERFACES_TYPE => "System.Runtime.InteropServices.ComSourceInterfacesAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMDEFAULTINTERFACE_TYPE_W => "System.Runtime.InteropServices.ComDefaultInterfaceAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMDEFAULTINTERFACE_TYPE => "System.Runtime.InteropServices.ComDefaultInterfaceAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMCONVERSIONLOSS_TYPE_W => "System.Runtime.InteropServices.ComConversionLossAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMCONVERSIONLOSS_TYPE => "System.Runtime.InteropServices.ComConversionLossAttribute"

    /**
     * @type {String}
     */
    static INTEROP_BESTFITMAPPING_TYPE_W => "System.Runtime.InteropServices.BestFitMappingAttribute"

    /**
     * @type {String}
     */
    static INTEROP_BESTFITMAPPING_TYPE => "System.Runtime.InteropServices.BestFitMappingAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBTYPE_TYPE_W => "System.Runtime.InteropServices.TypeLibTypeAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBTYPE_TYPE => "System.Runtime.InteropServices.TypeLibTypeAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBFUNC_TYPE_W => "System.Runtime.InteropServices.TypeLibFuncAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBFUNC_TYPE => "System.Runtime.InteropServices.TypeLibFuncAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBVAR_TYPE_W => "System.Runtime.InteropServices.TypeLibVarAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBVAR_TYPE => "System.Runtime.InteropServices.TypeLibVarAttribute"

    /**
     * @type {String}
     */
    static INTEROP_MARSHALAS_TYPE_W => "System.Runtime.InteropServices.MarshalAsAttribute"

    /**
     * @type {String}
     */
    static INTEROP_MARSHALAS_TYPE => "System.Runtime.InteropServices.MarshalAsAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMIMPORT_TYPE_W => "System.Runtime.InteropServices.ComImportAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMIMPORT_TYPE => "System.Runtime.InteropServices.ComImportAttribute"

    /**
     * @type {String}
     */
    static INTEROP_GUID_TYPE_W => "System.Runtime.InteropServices.GuidAttribute"

    /**
     * @type {String}
     */
    static INTEROP_GUID_TYPE => "System.Runtime.InteropServices.GuidAttribute"

    /**
     * @type {String}
     */
    static INTEROP_DEFAULTMEMBER_TYPE_W => "System.Reflection.DefaultMemberAttribute"

    /**
     * @type {String}
     */
    static INTEROP_DEFAULTMEMBER_TYPE => "System.Reflection.DefaultMemberAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMEMULATE_TYPE_W => "System.Runtime.InteropServices.ComEmulateAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMEMULATE_TYPE => "System.Runtime.InteropServices.ComEmulateAttribute"

    /**
     * @type {String}
     */
    static INTEROP_PRESERVESIG_TYPE_W => "System.Runtime.InteropServices.PreserveSigAttribure"

    /**
     * @type {String}
     */
    static INTEROP_PRESERVESIG_TYPE => "System.Runtime.InteropServices.PreserveSigAttribure"

    /**
     * @type {String}
     */
    static INTEROP_IN_TYPE_W => "System.Runtime.InteropServices.InAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IN_TYPE => "System.Runtime.InteropServices.InAttribute"

    /**
     * @type {String}
     */
    static INTEROP_OUT_TYPE_W => "System.Runtime.InteropServices.OutAttribute"

    /**
     * @type {String}
     */
    static INTEROP_OUT_TYPE => "System.Runtime.InteropServices.OutAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMALIASNAME_TYPE_W => "System.Runtime.InteropServices.ComAliasNameAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMALIASNAME_TYPE => "System.Runtime.InteropServices.ComAliasNameAttribute"

    /**
     * @type {String}
     */
    static INTEROP_PARAMARRAY_TYPE_W => "System.ParamArrayAttribute"

    /**
     * @type {String}
     */
    static INTEROP_PARAMARRAY_TYPE => "System.ParamArrayAttribute"

    /**
     * @type {String}
     */
    static INTEROP_LCIDCONVERSION_TYPE_W => "System.Runtime.InteropServices.LCIDConversionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_LCIDCONVERSION_TYPE => "System.Runtime.InteropServices.LCIDConversionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMSUBSTITUTABLEINTERFACE_TYPE_W => "System.Runtime.InteropServices.ComSubstitutableInterfaceAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMSUBSTITUTABLEINTERFACE_TYPE => "System.Runtime.InteropServices.ComSubstitutableInterfaceAttribute"

    /**
     * @type {String}
     */
    static INTEROP_DECIMALVALUE_TYPE_W => "System.Runtime.CompilerServices.DecimalConstantAttribute"

    /**
     * @type {String}
     */
    static INTEROP_DECIMALVALUE_TYPE => "System.Runtime.CompilerServices.DecimalConstantAttribute"

    /**
     * @type {String}
     */
    static INTEROP_DATETIMEVALUE_TYPE_W => "System.Runtime.CompilerServices.DateTimeConstantAttribute"

    /**
     * @type {String}
     */
    static INTEROP_DATETIMEVALUE_TYPE => "System.Runtime.CompilerServices.DateTimeConstantAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IUNKNOWNVALUE_TYPE_W => "System.Runtime.CompilerServices.IUnknownConstantAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IUNKNOWNVALUE_TYPE => "System.Runtime.CompilerServices.IUnknownConstantAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IDISPATCHVALUE_TYPE_W => "System.Runtime.CompilerServices.IDispatchConstantAttribute"

    /**
     * @type {String}
     */
    static INTEROP_IDISPATCHVALUE_TYPE => "System.Runtime.CompilerServices.IDispatchConstantAttribute"

    /**
     * @type {String}
     */
    static INTEROP_AUTOPROXY_TYPE_W => "System.Runtime.InteropServices.AutomationProxyAttribute"

    /**
     * @type {String}
     */
    static INTEROP_AUTOPROXY_TYPE => "System.Runtime.InteropServices.AutomationProxyAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBIMPORTCLASS_TYPE_W => "System.Runtime.InteropServices.TypeLibImportClassAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBIMPORTCLASS_TYPE => "System.Runtime.InteropServices.TypeLibImportClassAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBVERSION_TYPE_W => "System.Runtime.InteropServices.TypeLibVersionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_TYPELIBVERSION_TYPE => "System.Runtime.InteropServices.TypeLibVersionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMCOMPATIBLEVERSION_TYPE_W => "System.Runtime.InteropServices.ComCompatibleVersionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMCOMPATIBLEVERSION_TYPE => "System.Runtime.InteropServices.ComCompatibleVersionAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMEVENTINTERFACE_TYPE_W => "System.Runtime.InteropServices.ComEventInterfaceAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COMEVENTINTERFACE_TYPE => "System.Runtime.InteropServices.ComEventInterfaceAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COCLASS_TYPE_W => "System.Runtime.InteropServices.CoClassAttribute"

    /**
     * @type {String}
     */
    static INTEROP_COCLASS_TYPE => "System.Runtime.InteropServices.CoClassAttribute"

    /**
     * @type {String}
     */
    static INTEROP_SERIALIZABLE_TYPE_W => "System.SerializableAttribute"

    /**
     * @type {String}
     */
    static INTEROP_SERIALIZABLE_TYPE => "System.SerializableAttribute"

    /**
     * @type {String}
     */
    static INTEROP_SETWIN32CONTEXTINIDISPATCHATTRIBUTE_TYPE_W => "System.Runtime.InteropServices.SetWin32ContextInIDispatchAttribute"

    /**
     * @type {String}
     */
    static INTEROP_SETWIN32CONTEXTINIDISPATCHATTRIBUTE_TYPE => "System.Runtime.InteropServices.SetWin32ContextInIDispatchAttribute"

    /**
     * @type {String}
     */
    static FORWARD_INTEROP_STUB_METHOD_TYPE_W => "System.Runtime.InteropServices.ManagedToNativeComInteropStubAttribute"

    /**
     * @type {String}
     */
    static FORWARD_INTEROP_STUB_METHOD_TYPE => "System.Runtime.InteropServices.ManagedToNativeComInteropStubAttribute"

    /**
     * @type {String}
     */
    static FRIEND_ASSEMBLY_TYPE_W => "System.Runtime.CompilerServices.InternalsVisibleToAttribute"

    /**
     * @type {String}
     */
    static FRIEND_ASSEMBLY_TYPE => "System.Runtime.CompilerServices.InternalsVisibleToAttribute"

    /**
     * @type {String}
     */
    static FRIEND_ACCESS_ALLOWED_ATTRIBUTE_TYPE_W => "System.Runtime.CompilerServices.FriendAccessAllowedAttribute"

    /**
     * @type {String}
     */
    static FRIEND_ACCESS_ALLOWED_ATTRIBUTE_TYPE => "System.Runtime.CompilerServices.FriendAccessAllowedAttribute"

    /**
     * @type {String}
     */
    static SUBJECT_ASSEMBLY_TYPE_W => "System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute"

    /**
     * @type {String}
     */
    static SUBJECT_ASSEMBLY_TYPE => "System.Runtime.CompilerServices.IgnoresAccessChecksToAttribute"

    /**
     * @type {String}
     */
    static DISABLED_PRIVATE_REFLECTION_TYPE_W => "System.Runtime.CompilerServices.DisablePrivateReflectionAttribute"

    /**
     * @type {String}
     */
    static DISABLED_PRIVATE_REFLECTION_TYPE => "System.Runtime.CompilerServices.DisablePrivateReflectionAttribute"

    /**
     * @type {String}
     */
    static DEFAULTDOMAIN_STA_TYPE_W => "System.STAThreadAttribute"

    /**
     * @type {String}
     */
    static DEFAULTDOMAIN_STA_TYPE => "System.STAThreadAttribute"

    /**
     * @type {String}
     */
    static DEFAULTDOMAIN_MTA_TYPE_W => "System.MTAThreadAttribute"

    /**
     * @type {String}
     */
    static DEFAULTDOMAIN_MTA_TYPE => "System.MTAThreadAttribute"

    /**
     * @type {String}
     */
    static DEFAULTDOMAIN_LOADEROPTIMIZATION_TYPE_W => "System.LoaderOptimizationAttribute"

    /**
     * @type {String}
     */
    static DEFAULTDOMAIN_LOADEROPTIMIZATION_TYPE => "System.LoaderOptimizationAttribute"

    /**
     * @type {String}
     */
    static NONVERSIONABLE_TYPE_W => "System.Runtime.Versioning.NonVersionableAttribute"

    /**
     * @type {String}
     */
    static NONVERSIONABLE_TYPE => "System.Runtime.Versioning.NonVersionableAttribute"

    /**
     * @type {String}
     */
    static COMPILATIONRELAXATIONS_TYPE_W => "System.Runtime.CompilerServices.CompilationRelaxationsAttribute"

    /**
     * @type {String}
     */
    static COMPILATIONRELAXATIONS_TYPE => "System.Runtime.CompilerServices.CompilationRelaxationsAttribute"

    /**
     * @type {String}
     */
    static RUNTIMECOMPATIBILITY_TYPE_W => "System.Runtime.CompilerServices.RuntimeCompatibilityAttribute"

    /**
     * @type {String}
     */
    static RUNTIMECOMPATIBILITY_TYPE => "System.Runtime.CompilerServices.RuntimeCompatibilityAttribute"

    /**
     * @type {String}
     */
    static DEFAULTDEPENDENCY_TYPE_W => "System.Runtime.CompilerServices.DefaultDependencyAttribute"

    /**
     * @type {String}
     */
    static DEFAULTDEPENDENCY_TYPE => "System.Runtime.CompilerServices.DefaultDependencyAttribute"

    /**
     * @type {String}
     */
    static DEPENDENCY_TYPE_W => "System.Runtime.CompilerServices.DependencyAttribute"

    /**
     * @type {String}
     */
    static DEPENDENCY_TYPE => "System.Runtime.CompilerServices.DependencyAttribute"

    /**
     * @type {String}
     */
    static TARGET_FRAMEWORK_TYPE_W => "System.Runtime.Versioning.TargetFrameworkAttribute"

    /**
     * @type {String}
     */
    static TARGET_FRAMEWORK_TYPE => "System.Runtime.Versioning.TargetFrameworkAttribute"

    /**
     * @type {String}
     */
    static ASSEMBLY_METADATA_TYPE_W => "System.Reflection.AssemblyMetadataAttribute"

    /**
     * @type {String}
     */
    static ASSEMBLY_METADATA_TYPE => "System.Reflection.AssemblyMetadataAttribute"

    /**
     * @type {String}
     */
    static CMOD_CALLCONV_NAMESPACE_OLD => "System.Runtime.InteropServices"

    /**
     * @type {String}
     */
    static CMOD_CALLCONV_NAMESPACE => "System.Runtime.CompilerServices"

    /**
     * @type {String}
     */
    static CMOD_CALLCONV_NAME_CDECL => "CallConvCdecl"

    /**
     * @type {String}
     */
    static CMOD_CALLCONV_NAME_STDCALL => "CallConvStdcall"

    /**
     * @type {String}
     */
    static CMOD_CALLCONV_NAME_THISCALL => "CallConvThiscall"

    /**
     * @type {String}
     */
    static CMOD_CALLCONV_NAME_FASTCALL => "CallConvFastcall"

    /**
     * @type {String}
     */
    static LIBID_ComPlusRuntime => "{bed7f4ea-1a96-11d2-8f08-00a0c9a6186d}"

    /**
     * @type {String}
     */
    static GUID_ExportedFromComPlus => "{90883f05-3d28-11d2-8f17-00a0c9a6186d}"

    /**
     * @type {String}
     */
    static GUID_ManagedName => "{0f21f359-ab84-41e8-9a78-36d110e6d2f9}"

    /**
     * @type {String}
     */
    static GUID_Function2Getter => "{54fc8f55-38de-4703-9c4e-250351302b1c}"

    /**
     * @type {String}
     */
    static CLSID_CorMetaDataDispenserRuntime => "{1ec2de53-75cc-11d2-9775-00a0c9b4d50c}"

    /**
     * @type {String}
     */
    static GUID_DispIdOverride => "{cd2bc5c9-f452-4326-b714-f9c539d4da58}"

    /**
     * @type {String}
     */
    static GUID_ForceIEnumerable => "{b64784eb-d8d4-4d9b-9acd-0e30806426f7}"

    /**
     * @type {String}
     */
    static GUID_PropGetCA => "{2941ff83-88d8-4f73-b6a9-bdf8712d000d}"

    /**
     * @type {String}
     */
    static GUID_PropPutCA => "{29533527-3683-4364-abc0-db1add822fa2}"

    /**
     * @type {String}
     */
    static CLSID_CLR_v1_MetaData => "{005023ca-72b1-11d3-9fc4-00c04f79a0a3}"

    /**
     * @type {String}
     */
    static CLSID_CLR_v2_MetaData => "{efea471a-44fd-4862-9292-0c58d46e1f3a}"

    /**
     * @type {String}
     */
    static MetaDataCheckDuplicatesFor => "{30fe7be8-d7d9-11d2-9f80-00c04f79a0a3}"

    /**
     * @type {String}
     */
    static MetaDataRefToDefCheck => "{de3856f8-d7d9-11d2-9f80-00c04f79a0a3}"

    /**
     * @type {String}
     */
    static MetaDataNotificationForTokenMovement => "{e5d71a4c-d7da-11d2-9f80-00c04f79a0a3}"

    /**
     * @type {String}
     */
    static MetaDataSetUpdate => "{2eee315c-d7db-11d2-9f80-00c04f79a0a3}"

    /**
     * @type {String}
     */
    static MetaDataImportOption => "{79700f36-4aac-11d3-84c3-009027868cb1}"

    /**
     * @type {String}
     */
    static MetaDataThreadSafetyOptions => "{f7559806-f266-42ea-8c63-0adb45e8b234}"

    /**
     * @type {String}
     */
    static MetaDataErrorIfEmitOutOfOrder => "{1547872d-dc03-11d2-9420-0000f8083460}"

    /**
     * @type {String}
     */
    static MetaDataGenerateTCEAdapters => "{dcc9de90-4151-11d3-88d6-00902754c43a}"

    /**
     * @type {String}
     */
    static MetaDataTypeLibImportNamespace => "{f17ff889-5a63-11d3-9ff2-00c04ff7431a}"

    /**
     * @type {String}
     */
    static MetaDataLinkerOptions => "{47e099b6-ae7c-4797-8317-b48aa645b8f9}"

    /**
     * @type {String}
     */
    static MetaDataRuntimeVersion => "{47e099b7-ae7c-4797-8317-b48aa645b8f9}"

    /**
     * @type {String}
     */
    static MetaDataMergerOptions => "{132d3a6e-b35d-464e-951a-42efb9fb6601}"

    /**
     * @type {String}
     */
    static MetaDataPreserveLocalRefs => "{a55c0354-e91b-468b-8648-7cc31035d533}"

    /**
     * @type {Integer (Int32)}
     */
    static DESCR_GROUP_METHODDEF => 0

    /**
     * @type {Integer (Int32)}
     */
    static DESCR_GROUP_METHODIMPL => 1

    /**
     * @type {String}
     */
    static CLSID_Cor => "{bee00010-ee77-11d0-a015-00c04fbbb884}"

    /**
     * @type {String}
     */
    static CLSID_CorMetaDataDispenser => "{e5cb7a31-7512-11d2-89ce-0080c792e5d8}"

    /**
     * @type {String}
     */
    static CLSID_CorMetaDataDispenserReg => "{435755ff-7397-11d2-9771-00a0c9b4d50c}"

    /**
     * @type {String}
     */
    static CLSID_CorMetaDataReg => "{87f3a1f5-7397-11d2-9771-00a0c9b4d50c}"

    /**
     * @type {Integer (Int32)}
     */
    static SIGN_MASK_ONEBYTE => -64

    /**
     * @type {Integer (Int32)}
     */
    static SIGN_MASK_TWOBYTE => -8192

    /**
     * @type {Integer (Int32)}
     */
    static SIGN_MASK_FOURBYTE => -268435456
;@endregion Constants

;@region Methods
    /**
     * Creates a dispenser class.
     * @param {Pointer<Guid>} rclsid Type: <b>REFCLSID</b>
     * 
     * This parameter must be <b>CLSID_CorMetaDataDispenser</b>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The interface to implement. This parameter can be either <b>IID_IMetaDataDispenser</b> or <b>IID_IMetaDataDispenserEx</b>.
     * @param {Pointer<Void>} ppv Type: <b>LPVOID*</b>
     * 
     * The dispenser class. The class implements <b>IMetaDataDispenser</b> or <b>IMetaDataDispenserEx.</b>
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rometadata/nf-rometadata-metadatagetdispenser
     * @since windows8.0
     */
    static MetaDataGetDispenser(rclsid, riid, ppv) {
        result := DllCall("RoMetadata.dll\MetaDataGetDispenser", "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * Locates and retrieves the metadata file that describes the Application Binary Interface (ABI) for the specified typename.
     * @remarks
     * The caller can optionally pass-in a metadata dispenser for the <b>RoGetMetaDataFile</b> function to open the metadata files through the <b>IMetaDataDispenserEx::OpenScope</b> method. 
     * 
     * If the metadata dispenser parameter is set to <b>nullptr</b>, the function creates an internal instance of the refactored metadata reader and uses that reader’s <b>IMetaDataDispenserEx::OpenScope</b> method.
     * 
     * 
     * 
     * The <b>RoGetMetaDataFile</b> function is guaranteed to be thread-safe if you pass-in <b>nullptr</b> to the metadata dispenser parameter, as the function creates an internal read-only metadata reader. This guarantee also holds if you pass in the read-only metadata reader, like  RoMetadata to the function.
     * 
     * 
     * 
     * All three output parameters are optional and none of them needs to be specified. Calling the <b>RoGetMetaDataFile</b> function with <b>nullptr</b> for all output parameters is equivalent to asking whether the input typename or namespace is defined.
     * 
     * 
     * 
     * The metadata reader object reference and the TypeDef token parameters paired, so both must be set together or be set to  <b>nullptr</b>.  
     * 
     * 
     * There are three possible type resolution scenarios:
     * 
     * <table>
     * <tr>
     * <td>
     * Scenario #1
     * 
     * </td>
     * <td>
     * <b>Typename input string is a type defined in a WinMD file.</b>
     * 
     * <ul>
     * <li>
     * Return Value
     * 
     * <b>S_OK</b>
     * 
     * </li>
     * <li>
     * Metadata file path output parameter
     * 
     * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it holds the absolute path of the .winmd file that describes the given type's ABI. The caller is responsible for freeing the <b>HSTRING</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
     * 
     * </li>
     * <li>
     * Reference to the metadata reader object output parameter
     * 
     * This is an optional output parameter. If not <b>nullptr</b>, it holds a reference to the metadata reader object (<b>IMetaDataImport2</b>) and the caller is responsible for releasing it. If the caller passes <b>nullptr</b> for this parameter, it means that the caller does not want the metadata reader object, so the function releases the internal reference.
     * 
     * </li>
     * <li>
     * Typedef token output parameter
     * 
     * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to the token of the type’s <b>typedef</b> entry. Language projections can use this token to call <b>IMetaDataImport::GetTypeDefProps</b> to get metadata about the type.
     * 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Scenario #2
     * 
     * </td>
     * <td><b>Typename input string is actually an existing namespace rather than a typename.</b><ul>
     * <li>
     * Return value
     * 
     * <b>RO_E_METADATA_NAME_IS_NAMESPACE</b>
     * 
     * </li>
     * <li>
     * Metadata file path output parameter
     * 
     * This is an optional output parameter. If not set to <b>nullptr</b> by the caller, it is set to <b>nullptr</b>.
     * 
     * </li>
     * <li>
     * Reference to the metadata reader object output parameter
     * 
     * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to <b>nullptr</b>.
     * 
     * </li>
     * <li>
     * Typedef token output parameter
     * 
     * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it will is to <b>mdTypeDefNil</b>.
     * 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Scenario #3
     * 
     * </td>
     * <td><b>Input string is not a type defined in any examined WinMD file</b><ul>
     * <li>
     * Return value
     * 
     * <b>RO_E_METADATA_NAME_NOT_FOUND</b>
     * 
     * </li>
     * <li>
     * Metadata file path output parameter
     * 
     * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to <b>nullptr</b>
     * 
     * </li>
     * <li>
     * Reference to the metadata reader object output parameter
     * 
     * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to <b>nullptr</b>
     * 
     * </li>
     * <li>
     * Typedef token output parameter
     * 
     * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to <b>mdTypeDefNil</b>.
     * 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The <b>RoGetMetaDataFile</b> function resolves an <b>interfacegroup</b>, because the <b>interfacegroup</b> also is a namespace-qualified typename. The <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nf-inspectable-iinspectable-getruntimeclassname">IInspectable::GetRuntimeClassName</a> method returns the string in dot-separated string format for use by <b>RoGetMetaDataFile</b>.
     * 
     * Resolving 3rd-party types from a process that's not in a Windows Store app is not supported. In this case, the function returns error <b>HRESULT_FROM_WIN32(ERROR_NO_PACKAGE)</b> and sets output parameters to <b>nullptr</b>. But Windows types are resolved in a process that's not in a Windows Store app.
     * @param {Pointer<Void>} name Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * The name to resolve, either a typename or a namespace. The name input string must be non-empty and must not contain embedded NUL characters. If the name is a dot-separated string, then the substring to the left of the last dot and the substring to the right of the last dot must be non-empty.
     * @param {Pointer<IMetaDataDispenserEx>} metaDataDispenser Type: <b>IMetaDataDispenserEx*</b>
     * 
     * A metadata dispenser that the caller can optionally pass in for the <b>RoGetMetaDataFile</b> function to be able to open the metadata files through the provided <b>IMetaDataDispenserEx::OpenScope</b> method. If the metadata dispenser parameter is set to <b>nullptr</b>, the function creates an internal instance of the refactored metadata reader (RoMetadata.dll) and uses its <b>IMetaDataDispenserEx::OpenScope</b> method. You can create a metadata dispenser using the <a href="https://docs.microsoft.com/windows/win32/api/rometadata/nf-rometadata-metadatagetdispenser">MetaDataGetDispenser</a> function.
     * @param {Pointer<Void>} metaDataFilePath Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
     * 
     * The absolute path of the metadata (.winmd) file that describes the ABI, unless set to <b>nullptr</b>. The caller is responsible for freeing the <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> method.
     * @param {Pointer<IMetaDataImport2>} metaDataImport Type: <b>IMetaDataImport2**</b>
     * 
     * A pointer to the metadata file reader object. If the caller passes in a <b>nullptr</b> ,  the function releases the <b>IMetaDataImport2</b> reference, otherwise the caller must release the reference. The value is set to <b>nullptr</b> on failure.
     * @param {Pointer<UInt32>} typeDefToken Type: <b>mdTypeDef*</b>
     * 
     * If the name input string is resolved successfully as a typename, this parameter is set to the  token of the typename.
     * 
     * On failure, this parameter is set to <b>mdTypeDefNil</b>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Resolution was successful, which means that the input string represents a type defined in a .winmd file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the following properties of the input name string does not hold:
     * 
     * <ul>
     * <li>Not null, not empty</li>
     * <li>Does not contain embedded null characters.</li>
     * <li>If a dot-separated string, the substring to the left of the last dot and the substring to the right of the last dot must be non-empty.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RO_E_METADATA_NAME_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input string is not a type defined in any examined .winmd file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RO_E_METADATA_NAME_IS_NAMESPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input string is an existing namespace rather than a typename.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-rogetmetadatafile
     * @since windows8.0
     */
    static RoGetMetaDataFile(name, metaDataDispenser, metaDataFilePath, metaDataImport, typeDefToken) {
        result := DllCall("api-ms-win-ro-typeresolution-l1-1-0.dll\RoGetMetaDataFile", "ptr", name, "ptr", metaDataDispenser, "ptr", metaDataFilePath, "ptr", metaDataImport, "uint*", typeDefToken, "int")
        return result
    }

    /**
     * Parses a type name and existing type parameters, in the case of parameterized types.
     * @remarks
     * The <b>RoParseTypeName</b> function parses the string-encoded  type name and returns an array of <b>HSTRING</b> values. The first element of the array is the base type, and the remaining array elements are the type parameters, if any, in pre-order tree traversal order. <b>S_OK</b> is returned if the parsing was successful. 
     * 
     * Here are examples of different possible input typenames:
     * 
     * <ul>
     * <li>
     * Example 1 (non-namespace-qualified type)
     * 
     * <ul>
     * <li>
     * <b>Input typename</b>
     * 
     * String
     * 
     * </li>
     * <li>
     * <b>Output</b>
     * 
     * Array element 0: String
     * 
     * </li>
     * </ul>
     * </li>
     * <li>
     * Example 2 (non-parameterized namespace-qualified type)
     * 
     * <ul>
     * <li>
     * <b>Input typename</b>
     * 
     * Windows.Foundation.IExtensionInformation
     * 
     * </li>
     * <li>
     * <b>Output</b>
     * 
     * Array element 0: Windows.Foundation.IExtensionInformation
     * 
     * </li>
     * </ul>
     * </li>
     * <li>
     * Example 3 (instantiated parameterized interface type)
     * 
     * <ul>
     * <li>
     * <b>Input typename</b>
     * 
     * Windows.Foundation.Collections.IIterator`1&lt;Windows.Foundation.Collections.IMapView`2&lt;Windows.Foundation.Collections.IVector`1&lt;String&gt;, String&gt;&gt;
     * 
     * </li>
     * <li>
     * <b>Output</b>
     * 
     * Array element 0: Windows.Foundation.Collections.IIterator`1
     * 
     * Array element 1: Windows.Foundation.Collections.IMapView`2
     * 
     * Array element 2: Windows.Foundation.Collections.IVector`1
     * 
     * Array element 3: String
     * 
     * Array element 4: String
     * 
     * </li>
     * </ul>
     * </li>
     * </ul>
     * When parsing a non-parameterized type, the <b>RoParseTypeName</b> function returns an array that has one element. Please refer to example 1 and example 2 above.
     * 
     * The input string must be non-empty and it must not contain any embedded null characters. Otherwise, the API fails with <b>E_INVALIDARG</b>.  If the <i>typename</i> is ill-formed, like  IVector`1&lt;, then the API will fail with  the <b>RO_E_METADATA_INVALID_TYPE_FORMAT</b> error code.
     * 
     * The <b>RoParseTypeName</b> function validates only the format of the <i>typename</i> and not its syntax. For example, the function validates that a namespace-qualified parameterized interface <i>typename</i> follows the format shown in the following table, but it does not impose any requirements on what characters/symbols can be used in the <i>typename</i>, except that it should not contain ` , &lt;, or &gt; characters.
     * 
     * The format for a string-encoded instantiated parameterized interface is as follows:
     * 
     * <table>
     * <tr>
     * <td>
     * Name of parameterized interface
     * 
     * </td>
     * <td>
     * Backtick character
     * (`)
     * 
     * </td>
     * <td>
     * Number of type parameters
     * 
     * </td>
     * <td>
     * Left angle bracket (&lt;)
     * 
     * </td>
     * <td>
     * Namespace qualified name of each type parameter, separated by commas.
     * 
     * </td>
     * <td>
     * Right angle bracket
     * (&gt;)
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Type parameters may be:
     * 
     * <ul>
     * <li>Non-parameterized, non-namespace-qualified types, like  WinRT fundamental types.</li>
     * <li>Non-parameterized namespace-qualified types.</li>
     * <li>Fully-instantiated namespace-qualified parameterized interfaces.</li>
     * </ul>
     * On success, the caller is responsible for deallocating the <i>typenameParts</i> array returned by <b>RoParseTypeName</b> by using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the array and <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> to free the <b>HSTRING</b> values.
     * @param {Pointer<Void>} typeName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * String-encoded typename. The typename can be a non-namespace-qualified type, a non-parameterized namespace-qualified type or a fully instantiated namespace-qualified parameterized type.
     * @param {Pointer<UInt32>} partsCount Type: <b>DWORD*</b>
     * 
     * Number of elements in the <i>typenameParts</i> array.
     * @param {Pointer<Void>} typeNameParts Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>**</b>
     * 
     * The first element of the array is the specified type, and the remaining array elements are the type parameters (if any) in prewalk tree order.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parsing was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>typeName</i> contains embedded nulls or is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RO_E_METADATA_INVALID_TYPE_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>typename</i> is not well formed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-roparsetypename
     * @since windows8.0
     */
    static RoParseTypeName(typeName, partsCount, typeNameParts) {
        result := DllCall("api-ms-win-ro-typeresolution-l1-1-0.dll\RoParseTypeName", "ptr", typeName, "uint*", partsCount, "ptr", typeNameParts, "int")
        return result
    }

    /**
     * Determine the direct children, types, and sub-namespaces of the specified Windows Runtime namespace, from any programming language supported by the Windows Runtime.
     * @remarks
     * Use the <b>RoResolveNamespace</b> function to explore Windows Runtime namespace hierarchies.
     * @param {Pointer<Void>} name Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * Full namespace for which we are trying to retrieve direct children. This is a required parameter.
     * 
     * If this namespace is empty or <b>nullptr</b>, the <b>RoResolveNamespace</b> function returns top-level namespaces. Both Windows  and other top-level namespaces are in the package graph.
     * @param {Pointer<Void>} windowsMetaDataDir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * Optional parameter that contains a path to the SDK directory to search for metadata (.winmd) files.
     * 
     * If this parameter is not specified (either empty or <b>nullptr</b>), the function searches in the default Windows metadata directory, %windir%\System32\WinMetadata.
     * @param {Integer} packageGraphDirsCount Type: <b>const DWORD</b>
     * 
     * Count of paths in the <i>packageGraphDirs</i> array.
     * @param {Pointer<Void>} packageGraphDirs Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
     * 
     * Count of package paths in the explicit package dependency graph array. The count is ignored if <i>packageGraphDirs</i> is <b>nullptr</b>.
     * @param {Pointer<UInt32>} metaDataFilePathsCount Type: <b>DWORD*</b>
     * 
     * Count of metadata files in the <i>metaDataFilePaths</i> array.
     * @param {Pointer<Void>} metaDataFilePaths Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>**</b>
     * 
     * Optional output parameter that contains callee-allocated array of absolute file paths of all metadata (.winmd) files that could possibly contain direct children of <i>name</i>.
     * @param {Pointer<UInt32>} subNamespacesCount Type: <b>DWORD*</b>
     * 
     * Count of metadata files in the <i>subNamespaces</i> array.
     * @param {Pointer<Void>} subNamespaces Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>**</b>
     * 
     * Optional output parameter that contains a callee-allocated array of names of direct children of the given namespace. This list is a hint of other subnamespaces and is not necessarily complete.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Namespace direct children resolution is successful, which means that at least one file or one subnamespace name was found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RO_E_METADATA_NAME_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates one of the following:
     * 
     * <ul>
     * <li><i>metaDataFilePaths</i> and <i>subNamespaces</i> output parameters are set, but no metadata files and no subnamespaces for the given namespace were found.</li>
     * <li><i>metaDataFilePaths</i> only is set, but no metadata files for the given namespace were found.</li>
     * <li><i>subNamespaces</i> only is set, but no subnamespaces for the given namespace were found.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates one of the following:
     * 
     * <ul>
     * <li>Both <i>metaDataFilePaths</i> and <i>subNamespaces</i> are not set.</li>
     * <li>Namespace name has embedded null characters.</li>
     * <li>Namespace is empty or <b>NULL</b> and <i>subNamespaces</i> is not set.</li>
     * <li>Namespace is empty or <b>NULL</b> and <i>metaDataFilePaths</i> is set.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-roresolvenamespace
     * @since windows8.0
     */
    static RoResolveNamespace(name, windowsMetaDataDir, packageGraphDirsCount, packageGraphDirs, metaDataFilePathsCount, metaDataFilePaths, subNamespacesCount, subNamespaces) {
        result := DllCall("api-ms-win-ro-typeresolution-l1-1-0.dll\RoResolveNamespace", "ptr", name, "ptr", windowsMetaDataDir, "uint", packageGraphDirsCount, "ptr", packageGraphDirs, "uint*", metaDataFilePathsCount, "ptr", metaDataFilePaths, "uint*", subNamespacesCount, "ptr", subNamespaces, "int")
        return result
    }

    /**
     * Returns true or false to indicate whether the API contract with the specified name and major and minor version number is present.
     * @remarks
     * This function was introduced in Windows 10, version 1809 (build 17763).
     * @param {Pointer<Char>} name Type: <b>PCWSTR</b>
     * 
     * The name of the API contract.
     * @param {Integer} majorVersion Type: <b>UINT16</b>
     * 
     * The major version number of the API contract.
     * @param {Integer} minorVersion Type: <b>UINT16</b>
     * 
     * The minor version number of the API contract.
     * @param {Pointer<Int32>} present Type: <b>BOOL*</b>
     * 
     * True if the specified API contract is present; otherwise, false.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified API contract is valid and is present.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RO_E_METADATA_NAME_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input string is not an API contract defined in any examined .winmd file.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RO_E_METADATA_NAME_IS_NAMESPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input string is an existing namespace rather than an API contract name.
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-roisapicontractpresent
     * @since windows10.0.10240
     */
    static RoIsApiContractPresent(name, majorVersion, minorVersion, present) {
        name := name is String? StrPtr(name) : name

        result := DllCall("api-ms-win-ro-typeresolution-l1-1-1.dll\RoIsApiContractPresent", "ptr", name, "ushort", majorVersion, "ushort", minorVersion, "int*", present, "int")
        return result
    }

    /**
     * Returns true or false to indicate whether the API contract with the specified name and major version number is present.
     * @remarks
     * This function was introduced in Windows 10, version 1809 (build 17763).
     * @param {Pointer<Char>} name Type: <b>PCWSTR</b>
     * 
     * The name of the API contract.
     * @param {Integer} majorVersion Type: <b>UINT16</b>
     * 
     * The major version number of the API contract.
     * @param {Pointer<Int32>} present Type: <b>BOOL*</b>
     * 
     * True if the specified API contract is present; otherwise, false.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified API contract is valid and is present.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RO_E_METADATA_NAME_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input string is not an API contract defined in any examined .winmd file.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RO_E_METADATA_NAME_IS_NAMESPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input string is an existing namespace rather than an API contract name.
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-roisapicontractmajorversionpresent
     * @since windows10.0.10240
     */
    static RoIsApiContractMajorVersionPresent(name, majorVersion, present) {
        name := name is String? StrPtr(name) : name

        result := DllCall("api-ms-win-ro-typeresolution-l1-1-1.dll\RoIsApiContractMajorVersionPresent", "ptr", name, "ushort", majorVersion, "int*", present, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IPropertySet>} ppPropertySet 
     * @returns {Integer} 
     */
    static RoCreateNonAgilePropertySet(ppPropertySet) {
        result := DllCall("api-ms-win-ro-typeresolution-l1-1-1.dll\RoCreateNonAgilePropertySet", "ptr", ppPropertySet, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IPropertySetSerializer>} ppPropertySetSerializer 
     * @returns {Integer} 
     */
    static RoCreatePropertySetSerializer(ppPropertySetSerializer) {
        result := DllCall("api-ms-win-ro-typeresolution-l1-1-1.dll\RoCreatePropertySetSerializer", "ptr", ppPropertySetSerializer, "int")
        return result
    }

    /**
     * Computes the interface identifier (IID) of the interface or delegate type that results when a parameterized interface or delegate is instantiated with the specified type arguments.
     * @remarks
     * The <b>RoGetParameterizedTypeInstanceIID</b> function is for use by programming language implementers.
     * 
     * This function is stateless.  The <i>metaDataLocator</i> argument is not preserved between calls and may be released as soon as the call returns.
     * 
     * 
     * 
     * The <b>RoGetParameterizedTypeInstanceIID</b> function does not perform deep semantic analysis.  For instance, if <a href="https://docs.microsoft.com/windows/desktop/api/roparameterizediid/ns-roparameterizediid-irosimplemetadatabuilder">IRoSimpleMetaDataBuilder</a> specifies that a structure contains an interface pointer, this function returns success, even though such metadata is semantically invalid. The value of the returned IID is unspecified in such cases.
     * 
     * This function may recursively invoke the metadata locator provided as an argument.
     * 
     * 
     * 
     * If a call to the <a href="https://docs.microsoft.com/windows/desktop/api/roparameterizediid/ns-roparameterizediid-irosimplemetadatabuilder">IRoSimpleMetaDataBuilder</a> function fails, this function will return that failure code.
     * @param {Integer} nameElementCount Type: <b>UINT32</b>
     * 
     * Number of elements in <i>nameElements.</i>
     * @param {Pointer<Char>} nameElements Type: <b>PCWSTR*</b>
     * 
     * A parsed Windows Runtime type name, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rometadataresolution/nf-rometadataresolution-roparsetypename">RoParseTypeName</a> function.
     * For example, "Windows.Foundation.Collections.IVector`1", and "N1.N2.IFoo".
     * @param {Pointer<IRoMetaDataLocator>} metaDataLocator Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/roparameterizediid/ns-roparameterizediid-irometadatalocator">IRoMetaDataLocator</a></b>
     * 
     * A callback to use for resolving metadata. 
     *                                                                   
     * An implementation should use the <a href="https://docs.microsoft.com/windows/desktop/api/rometadataresolution/nf-rometadataresolution-rogetmetadatafile">RoGetMetaDataFile</a> function to discover the necessary metadata (.winmd) file and examine the metadata to determine the necessary type information. Because the <b>RoGetMetaDataFile</b> function does not cache results, locators should cache the results as appropriate for the programming model being implemented.
     * @param {Pointer<Guid>} iid Type: <b>GUID*</b>
     * 
     * The IID of the interface or delegate that corresponds with <i>nameElements</i>.
     * @param {Pointer<Void>} pExtra Type: <b>ROPARAMIIDHANDLE*</b>
     * 
     * Handle to the IID that corresponds with <i>nameElements</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory available to complete the task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wrong number of type arguments are provided for a parameterized type.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * A failure may also occur if a type is inappropriate for the context in which it appears.
     * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/nf-roparameterizediid-rogetparameterizedtypeinstanceiid
     * @since windows8.0
     */
    static RoGetParameterizedTypeInstanceIID(nameElementCount, nameElements, metaDataLocator, iid, pExtra) {
        result := DllCall("api-ms-win-core-winrt-roparameterizediid-l1-1-0.dll\RoGetParameterizedTypeInstanceIID", "uint", nameElementCount, "ptr", nameElements, "ptr", metaDataLocator, "ptr", iid, "ptr", pExtra, "int")
        return result
    }

    /**
     * Frees the handle allocated by RoGetParameterizedTypeInstanceIID.
     * @param {Pointer<Void>} extra Type: <b>ROPARAMIIDHANDLE</b>
     * 
     * A handle to the IID.
     * @returns {Pointer} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/nf-roparameterizediid-rofreeparameterizedtypeextra
     * @since windows8.0
     */
    static RoFreeParameterizedTypeExtra(extra) {
        result := DllCall("api-ms-win-core-winrt-roparameterizediid-l1-1-0.dll\RoFreeParameterizedTypeExtra", "ptr", extra)
        return result
    }

    /**
     * Gets the type signature used to compute the IID from the last call to RoGetParameterizedTypeInstanceIID with the specified handle.
     * @param {Pointer<Void>} extra Type: <b>ROPARAMIIDHANDLE</b>
     * 
     * A handle to the IID.
     * @returns {Pointer<Byte>} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/nf-roparameterizediid-roparameterizedtypeextragettypesignature
     * @since windows8.0
     */
    static RoParameterizedTypeExtraGetTypeSignature(extra) {
        result := DllCall("api-ms-win-core-winrt-roparameterizediid-l1-1-0.dll\RoParameterizedTypeExtraGetTypeSignature", "ptr", extra, "char*")
        return result
    }

;@endregion Methods
}
