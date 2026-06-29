#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.Shell
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global HLINK_E_FIRST := -2147221248

/**
 * @type {Integer (Int32)}
 */
export global HLINK_S_FIRST := 262400

/**
 * @type {Integer (UInt32)}
 */
export global WM_CPL_LAUNCH := 2024

/**
 * @type {Integer (UInt32)}
 */
export global WM_CPL_LAUNCHED := 2025

/**
 * @type {Integer (UInt32)}
 */
export global CPL_DYNAMIC_RES := 0

/**
 * @type {Integer (UInt32)}
 */
export global CPL_INIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPL_GETCOUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPL_INQUIRE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CPL_SELECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CPL_DBLCLK := 5

/**
 * @type {Integer (UInt32)}
 */
export global CPL_STOP := 6

/**
 * @type {Integer (UInt32)}
 */
export global CPL_EXIT := 7

/**
 * @type {Integer (UInt32)}
 */
export global CPL_NEWINQUIRE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CPL_STARTWPARMSA := 9

/**
 * @type {Integer (UInt32)}
 */
export global CPL_STARTWPARMSW := 10

/**
 * @type {Integer (UInt32)}
 */
export global CPL_STARTWPARMS := 10

/**
 * @type {Integer (UInt32)}
 */
export global CPL_SETUP := 200

/**
 * @type {Integer (Int32)}
 */
export global HLINK_S_DONTHIDE := 262400

/**
 * @type {Guid}
 */
export global FOLDERID_NetworkFolder := Guid("{d20beec4-5ca8-4905-ae3b-bf251ea09b53}")

/**
 * @type {Guid}
 */
export global FOLDERID_ComputerFolder := Guid("{0ac0837c-bbf8-452a-850d-79d08e667ca7}")

/**
 * @type {Guid}
 */
export global FOLDERID_InternetFolder := Guid("{4d9f7874-4e0c-4904-967b-40b0d20c3e4b}")

/**
 * @type {Guid}
 */
export global FOLDERID_ControlPanelFolder := Guid("{82a74aeb-aeb4-465c-a014-d097ee346d63}")

/**
 * @type {Guid}
 */
export global FOLDERID_PrintersFolder := Guid("{76fc4e2d-d6ad-4519-a663-37bd56068185}")

/**
 * @type {Guid}
 */
export global FOLDERID_SyncManagerFolder := Guid("{43668bf8-c14e-49b2-97c9-747784d784b7}")

/**
 * @type {Guid}
 */
export global FOLDERID_SyncSetupFolder := Guid("{0f214138-b1d3-4a90-bba9-27cbc0c5389a}")

/**
 * @type {Guid}
 */
export global FOLDERID_ConflictFolder := Guid("{4bfefb45-347d-4006-a5be-ac0cb0567192}")

/**
 * @type {Guid}
 */
export global FOLDERID_SyncResultsFolder := Guid("{289a9a43-be44-4057-a41b-587a76d7e7f9}")

/**
 * @type {Guid}
 */
export global FOLDERID_RecycleBinFolder := Guid("{b7534046-3ecb-4c18-be4e-64cd4cb7d6ac}")

/**
 * @type {Guid}
 */
export global FOLDERID_ConnectionsFolder := Guid("{6f0cd92b-2e97-45d1-88ff-b0d186b8dedd}")

/**
 * @type {Guid}
 */
export global FOLDERID_Fonts := Guid("{fd228cb7-ae11-4ae3-864c-16f3910ab8fe}")

/**
 * @type {Guid}
 */
export global FOLDERID_Desktop := Guid("{b4bfcc3a-db2c-424c-b029-7fe99a87c641}")

/**
 * @type {Guid}
 */
export global FOLDERID_Startup := Guid("{b97d20bb-f46a-4c97-ba10-5e3608430854}")

/**
 * @type {Guid}
 */
export global FOLDERID_Programs := Guid("{a77f5d77-2e2b-44c3-a6a2-aba601054a51}")

/**
 * @type {Guid}
 */
export global FOLDERID_StartMenu := Guid("{625b53c3-ab48-4ec1-ba1f-a1ef4146fc19}")

/**
 * @type {Guid}
 */
export global FOLDERID_Recent := Guid("{ae50c081-ebd2-438a-8655-8a092e34987a}")

/**
 * @type {Guid}
 */
export global FOLDERID_SendTo := Guid("{8983036c-27c0-404b-8f08-102d10dcfd74}")

/**
 * @type {Guid}
 */
export global FOLDERID_Documents := Guid("{fdd39ad0-238f-46af-adb4-6c85480369c7}")

/**
 * @type {Guid}
 */
export global FOLDERID_Favorites := Guid("{1777f761-68ad-4d8a-87bd-30b759fa33dd}")

/**
 * @type {Guid}
 */
export global FOLDERID_NetHood := Guid("{c5abbf53-e17f-4121-8900-86626fc2c973}")

/**
 * @type {Guid}
 */
export global FOLDERID_PrintHood := Guid("{9274bd8d-cfd1-41c3-b35e-b13f55a758f4}")

/**
 * @type {Guid}
 */
export global FOLDERID_Templates := Guid("{a63293e8-664e-48db-a079-df759e0509f7}")

/**
 * @type {Guid}
 */
export global FOLDERID_CommonStartup := Guid("{82a5ea35-d9cd-47c5-9629-e15d2f714e6e}")

/**
 * @type {Guid}
 */
export global FOLDERID_CommonPrograms := Guid("{0139d44e-6afe-49f2-8690-3dafcae6ffb8}")

/**
 * @type {Guid}
 */
export global FOLDERID_CommonStartMenu := Guid("{a4115719-d62e-491d-aa7c-e74b8be3b067}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicDesktop := Guid("{c4aa340d-f20f-4863-afef-f87ef2e6ba25}")

/**
 * @type {Guid}
 */
export global FOLDERID_ProgramData := Guid("{62ab5d82-fdc1-4dc3-a9dd-070d1d495d97}")

/**
 * @type {Guid}
 */
export global FOLDERID_CommonTemplates := Guid("{b94237e7-57ac-4347-9151-b08c6c32d1f7}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicDocuments := Guid("{ed4824af-dce4-45a8-81e2-fc7965083634}")

/**
 * @type {Guid}
 */
export global FOLDERID_RoamingAppData := Guid("{3eb685db-65f9-4cf6-a03a-e3ef65729f3d}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalAppData := Guid("{f1b32785-6fba-4fcf-9d55-7b8e7f157091}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalAppDataLow := Guid("{a520a1a4-1780-4ff6-bd18-167343c5af16}")

/**
 * @type {Guid}
 */
export global FOLDERID_InternetCache := Guid("{352481e8-33be-4251-ba85-6007caedcf9d}")

/**
 * @type {Guid}
 */
export global FOLDERID_Cookies := Guid("{2b0f765d-c0e9-4171-908e-08a611b84ff6}")

/**
 * @type {Guid}
 */
export global FOLDERID_History := Guid("{d9dc8a3b-b784-432e-a781-5a1130a75963}")

/**
 * @type {Guid}
 */
export global FOLDERID_System := Guid("{1ac14e77-02e7-4e5d-b744-2eb1ae5198b7}")

/**
 * @type {Guid}
 */
export global FOLDERID_SystemX86 := Guid("{d65231b0-b2f1-4857-a4ce-a8e7c6ea7d27}")

/**
 * @type {Guid}
 */
export global FOLDERID_Windows := Guid("{f38bf404-1d43-42f2-9305-67de0b28fc23}")

/**
 * @type {Guid}
 */
export global FOLDERID_Profile := Guid("{5e6c858f-0e22-4760-9afe-ea3317b67173}")

/**
 * @type {Guid}
 */
export global FOLDERID_Pictures := Guid("{33e28130-4e1e-4676-835a-98395c3bc3bb}")

/**
 * @type {Guid}
 */
export global FOLDERID_ProgramFilesX86 := Guid("{7c5a40ef-a0fb-4bfc-874a-c0f2e0b9fa8e}")

/**
 * @type {Guid}
 */
export global FOLDERID_ProgramFilesCommonX86 := Guid("{de974d24-d9c6-4d3e-bf91-f4455120b917}")

/**
 * @type {Guid}
 */
export global FOLDERID_ProgramFilesX64 := Guid("{6d809377-6af0-444b-8957-a3773f02200e}")

/**
 * @type {Guid}
 */
export global FOLDERID_ProgramFilesCommonX64 := Guid("{6365d5a7-0f0d-45e5-87f6-0da56b6a4f7d}")

/**
 * @type {Guid}
 */
export global FOLDERID_ProgramFiles := Guid("{905e63b6-c1bf-494e-b29c-65b732d3d21a}")

/**
 * @type {Guid}
 */
export global FOLDERID_ProgramFilesCommon := Guid("{f7f1ed05-9f6d-47a2-aaae-29d317c6f066}")

/**
 * @type {Guid}
 */
export global FOLDERID_UserProgramFiles := Guid("{5cd7aee2-2219-4a67-b85d-6c9ce15660cb}")

/**
 * @type {Guid}
 */
export global FOLDERID_UserProgramFilesCommon := Guid("{bcbd3057-ca5c-4622-b42d-bc56db0ae516}")

/**
 * @type {Guid}
 */
export global FOLDERID_AdminTools := Guid("{724ef170-a42d-4fef-9f26-b60e846fba4f}")

/**
 * @type {Guid}
 */
export global FOLDERID_CommonAdminTools := Guid("{d0384e7d-bac3-4797-8f14-cba229b392b5}")

/**
 * @type {Guid}
 */
export global FOLDERID_Music := Guid("{4bd8d571-6d19-48d3-be97-422220080e43}")

/**
 * @type {Guid}
 */
export global FOLDERID_Videos := Guid("{18989b1d-99b5-455b-841c-ab7c74e4ddfc}")

/**
 * @type {Guid}
 */
export global FOLDERID_Ringtones := Guid("{c870044b-f49e-4126-a9c3-b52a1ff411e8}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicPictures := Guid("{b6ebfb86-6907-413c-9af7-4fc2abf07cc5}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicMusic := Guid("{3214fab5-9757-4298-bb61-92a9deaa44ff}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicVideos := Guid("{2400183a-6185-49fb-a2d8-4a392a602ba3}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicRingtones := Guid("{e555ab60-153b-4d17-9f04-a5fe99fc15ec}")

/**
 * @type {Guid}
 */
export global FOLDERID_ResourceDir := Guid("{8ad10c31-2adb-4296-a8f7-e4701232c972}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalizedResourcesDir := Guid("{2a00375e-224c-49de-b8d1-440df7ef3ddc}")

/**
 * @type {Guid}
 */
export global FOLDERID_CommonOEMLinks := Guid("{c1bae2d0-10df-4334-bedd-7aa20b227a9d}")

/**
 * @type {Guid}
 */
export global FOLDERID_CDBurning := Guid("{9e52ab10-f80d-49df-acb8-4330f5687855}")

/**
 * @type {Guid}
 */
export global FOLDERID_UserProfiles := Guid("{0762d272-c50a-4bb0-a382-697dcd729b80}")

/**
 * @type {Guid}
 */
export global FOLDERID_Playlists := Guid("{de92c1c7-837f-4f69-a3bb-86e631204a23}")

/**
 * @type {Guid}
 */
export global FOLDERID_SamplePlaylists := Guid("{15ca69b3-30ee-49c1-ace1-6b5ec372afb5}")

/**
 * @type {Guid}
 */
export global FOLDERID_SampleMusic := Guid("{b250c668-f57d-4ee1-a63c-290ee7d1aa1f}")

/**
 * @type {Guid}
 */
export global FOLDERID_SamplePictures := Guid("{c4900540-2379-4c75-844b-64e6faf8716b}")

/**
 * @type {Guid}
 */
export global FOLDERID_SampleVideos := Guid("{859ead94-2e85-48ad-a71a-0969cb56a6cd}")

/**
 * @type {Guid}
 */
export global FOLDERID_PhotoAlbums := Guid("{69d2cf90-fc33-4fb7-9a0c-ebb0f0fcb43c}")

/**
 * @type {Guid}
 */
export global FOLDERID_Public := Guid("{dfdf76a2-c82a-4d63-906a-5644ac457385}")

/**
 * @type {Guid}
 */
export global FOLDERID_ChangeRemovePrograms := Guid("{df7266ac-9274-4867-8d55-3bd661de872d}")

/**
 * @type {Guid}
 */
export global FOLDERID_AppUpdates := Guid("{a305ce99-f527-492b-8b1a-7e76fa98d6e4}")

/**
 * @type {Guid}
 */
export global FOLDERID_AddNewPrograms := Guid("{de61d971-5ebc-4f02-a3a9-6c82895e5c04}")

/**
 * @type {Guid}
 */
export global FOLDERID_Downloads := Guid("{374de290-123f-4565-9164-39c4925e467b}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicDownloads := Guid("{3d644c9b-1fb8-4f30-9b45-f670235f79c0}")

/**
 * @type {Guid}
 */
export global FOLDERID_SavedSearches := Guid("{7d1d3a04-debb-4115-95cf-2f29da2920da}")

/**
 * @type {Guid}
 */
export global FOLDERID_QuickLaunch := Guid("{52a4f021-7b75-48a9-9f6b-4b87a210bc8f}")

/**
 * @type {Guid}
 */
export global FOLDERID_Contacts := Guid("{56784854-c6cb-462b-8169-88e350acb882}")

/**
 * @type {Guid}
 */
export global FOLDERID_SidebarParts := Guid("{a75d362e-50fc-4fb7-ac2c-a8beaa314493}")

/**
 * @type {Guid}
 */
export global FOLDERID_SidebarDefaultParts := Guid("{7b396e54-9ec5-4300-be0a-2482ebae1a26}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicGameTasks := Guid("{debf2536-e1a8-4c59-b6a2-414586476aea}")

/**
 * @type {Guid}
 */
export global FOLDERID_GameTasks := Guid("{054fae61-4dd8-4787-80b6-090220c4b700}")

/**
 * @type {Guid}
 */
export global FOLDERID_SavedGames := Guid("{4c5c32ff-bb9d-43b0-b5b4-2d72e54eaaa4}")

/**
 * @type {Guid}
 */
export global FOLDERID_Games := Guid("{cac52c1a-b53d-4edc-92d7-6b2e8ac19434}")

/**
 * @type {Guid}
 */
export global FOLDERID_SEARCH_MAPI := Guid("{98ec0e18-2098-4d44-8644-66979315a281}")

/**
 * @type {Guid}
 */
export global FOLDERID_SEARCH_CSC := Guid("{ee32e446-31ca-4aba-814f-a5ebd2fd6d5e}")

/**
 * @type {Guid}
 */
export global FOLDERID_Links := Guid("{bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968}")

/**
 * @type {Guid}
 */
export global FOLDERID_UsersFiles := Guid("{f3ce0f7c-4901-4acc-8648-d5d44b04ef8f}")

/**
 * @type {Guid}
 */
export global FOLDERID_UsersLibraries := Guid("{a302545d-deff-464b-abe8-61c8648d939b}")

/**
 * @type {Guid}
 */
export global FOLDERID_SearchHome := Guid("{190337d1-b8ca-4121-a639-6d472d16972a}")

/**
 * @type {Guid}
 */
export global FOLDERID_OriginalImages := Guid("{2c36c0aa-5812-4b87-bfd0-4cd0dfb19b39}")

/**
 * @type {Guid}
 */
export global FOLDERID_DocumentsLibrary := Guid("{7b0db17d-9cd2-4a93-9733-46cc89022e7c}")

/**
 * @type {Guid}
 */
export global FOLDERID_MusicLibrary := Guid("{2112ab0a-c86a-4ffe-a368-0de96e47012e}")

/**
 * @type {Guid}
 */
export global FOLDERID_PicturesLibrary := Guid("{a990ae9f-a03b-4e80-94bc-9912d7504104}")

/**
 * @type {Guid}
 */
export global FOLDERID_VideosLibrary := Guid("{491e922f-5643-4af4-a7eb-4e7a138d8174}")

/**
 * @type {Guid}
 */
export global FOLDERID_RecordedTVLibrary := Guid("{1a6fdba2-f42d-4358-a798-b74d745926c5}")

/**
 * @type {Guid}
 */
export global FOLDERID_HomeGroup := Guid("{52528a6b-b9e3-4add-b60d-588c2dba842d}")

/**
 * @type {Guid}
 */
export global FOLDERID_HomeGroupCurrentUser := Guid("{9b74b6a3-0dfd-4f11-9e78-5f7800f2e772}")

/**
 * @type {Guid}
 */
export global FOLDERID_DeviceMetadataStore := Guid("{5ce4a5e9-e4eb-479d-b89f-130c02886155}")

/**
 * @type {Guid}
 */
export global FOLDERID_Libraries := Guid("{1b3ea5dc-b587-4786-b4ef-bd1dc332aeae}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicLibraries := Guid("{48daf80b-e6cf-4f4e-b800-0e69d84ee384}")

/**
 * @type {Guid}
 */
export global FOLDERID_UserPinned := Guid("{9e3995ab-1f9c-4f13-b827-48b24b6c7174}")

/**
 * @type {Guid}
 */
export global FOLDERID_ImplicitAppShortcuts := Guid("{bcb5256f-79f6-4cee-b725-dc34e402fd46}")

/**
 * @type {Guid}
 */
export global FOLDERID_AccountPictures := Guid("{008ca0b1-55b4-4c56-b8a8-4de4b299d3be}")

/**
 * @type {Guid}
 */
export global FOLDERID_PublicUserTiles := Guid("{0482af6c-08f1-4c34-8c90-e17ec98b1e17}")

/**
 * @type {Guid}
 */
export global FOLDERID_AppsFolder := Guid("{1e87508d-89c2-42f0-8a7e-645a0f50ca58}")

/**
 * @type {Guid}
 */
export global FOLDERID_StartMenuAllPrograms := Guid("{f26305ef-6948-40b9-b255-81453d09c785}")

/**
 * @type {Guid}
 */
export global FOLDERID_CommonStartMenuPlaces := Guid("{a440879f-87a0-4f7d-b700-0207b966194a}")

/**
 * @type {Guid}
 */
export global FOLDERID_ApplicationShortcuts := Guid("{a3918781-e5f2-4890-b3d9-a7e54332328c}")

/**
 * @type {Guid}
 */
export global FOLDERID_RoamingTiles := Guid("{00bcfc5a-ed94-4e48-96a1-3f6217f21990}")

/**
 * @type {Guid}
 */
export global FOLDERID_RoamedTileImages := Guid("{aaa8d5a5-f1d6-4259-baa8-78e7ef60835e}")

/**
 * @type {Guid}
 */
export global FOLDERID_Screenshots := Guid("{b7bede81-df94-4682-a7d8-57a52620b86f}")

/**
 * @type {Guid}
 */
export global FOLDERID_CameraRoll := Guid("{ab5fb87b-7ce2-4f83-915d-550846c9537b}")

/**
 * @type {Guid}
 */
export global FOLDERID_SkyDrive := Guid("{a52bba46-e9e1-435f-b3d9-28daa648c0f6}")

/**
 * @type {Guid}
 */
export global FOLDERID_OneDrive := Guid("{a52bba46-e9e1-435f-b3d9-28daa648c0f6}")

/**
 * @type {Guid}
 */
export global FOLDERID_SkyDriveDocuments := Guid("{24d89e24-2f19-4534-9dde-6a6671fbb8fe}")

/**
 * @type {Guid}
 */
export global FOLDERID_SkyDrivePictures := Guid("{339719b5-8c47-4894-94c2-d8f77add44a6}")

/**
 * @type {Guid}
 */
export global FOLDERID_SkyDriveMusic := Guid("{c3f2459e-80d6-45dc-bfef-1f769f2be730}")

/**
 * @type {Guid}
 */
export global FOLDERID_SkyDriveCameraRoll := Guid("{767e6811-49cb-4273-87c2-20f355e1085b}")

/**
 * @type {Guid}
 */
export global FOLDERID_SearchHistory := Guid("{0d4c3db6-03a3-462f-a0e6-08924c41b5d4}")

/**
 * @type {Guid}
 */
export global FOLDERID_SearchTemplates := Guid("{7e636bfe-dfa9-4d5e-b456-d7b39851d8a9}")

/**
 * @type {Guid}
 */
export global FOLDERID_CameraRollLibrary := Guid("{2b20df75-1eda-4039-8097-38798227d5b7}")

/**
 * @type {Guid}
 */
export global FOLDERID_SavedPictures := Guid("{3b193882-d3ad-4eab-965a-69829d1fb59f}")

/**
 * @type {Guid}
 */
export global FOLDERID_SavedPicturesLibrary := Guid("{e25b5812-be88-4bd9-94b0-29233477b6c3}")

/**
 * @type {Guid}
 */
export global FOLDERID_RetailDemo := Guid("{12d4c69e-24ad-4923-be19-31321c43a767}")

/**
 * @type {Guid}
 */
export global FOLDERID_Device := Guid("{1c2ac1dc-4358-4b6c-9733-af21156576f0}")

/**
 * @type {Guid}
 */
export global FOLDERID_DevelopmentFiles := Guid("{dbe8e08e-3053-4bbc-b183-2a7b2b191e59}")

/**
 * @type {Guid}
 */
export global FOLDERID_Objects3D := Guid("{31c0dd25-9439-4f12-bf41-7ff4eda38722}")

/**
 * @type {Guid}
 */
export global FOLDERID_AppCaptures := Guid("{edc0fe71-98d8-4f4a-b920-c8dc133cb165}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalDocuments := Guid("{f42ee2d3-909f-4907-8871-4c22fc0bf756}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalPictures := Guid("{0ddd015d-b06c-45d5-8c4c-f59713854639}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalVideos := Guid("{35286a68-3c57-41a1-bbb1-0eae73d76c95}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalMusic := Guid("{a0c69a99-21c8-4671-8703-7934162fcf1d}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalDownloads := Guid("{7d83ee9b-2244-4e70-b1f5-5393042af1e4}")

/**
 * @type {Guid}
 */
export global FOLDERID_RecordedCalls := Guid("{2f8b40c2-83ed-48ee-b383-a1f157ec6f9a}")

/**
 * @type {Guid}
 */
export global FOLDERID_AllAppMods := Guid("{7ad67899-66af-43ba-9156-6aad42e6c596}")

/**
 * @type {Guid}
 */
export global FOLDERID_CurrentAppMods := Guid("{3db40b20-2a30-4dbe-917e-771dd21dd099}")

/**
 * @type {Guid}
 */
export global FOLDERID_AppDataDesktop := Guid("{b2c5e279-7add-439f-b28c-c41fe1bbf672}")

/**
 * @type {Guid}
 */
export global FOLDERID_AppDataDocuments := Guid("{7be16610-1f7f-44ac-bff0-83e15f2ffca1}")

/**
 * @type {Guid}
 */
export global FOLDERID_AppDataFavorites := Guid("{7cfbefbc-de1f-45aa-b843-a542ac536cc9}")

/**
 * @type {Guid}
 */
export global FOLDERID_AppDataProgramData := Guid("{559d40a3-a036-40fa-af61-84cb430a4d34}")

/**
 * @type {Guid}
 */
export global FOLDERID_LocalStorage := Guid("{b3eb08d3-a1f3-496b-865a-42b536cda0ec}")

/**
 * @type {Guid}
 */
export global CLSID_InternetShortcut := Guid("{fbf23b40-e3f0-101b-8488-00aa003e56f8}")

/**
 * @type {Guid}
 */
export global CLSID_NetworkDomain := Guid("{46e06680-4bf0-11d1-83ee-00a0c90dc849}")

/**
 * @type {Guid}
 */
export global CLSID_NetworkServer := Guid("{c0542a90-4bf0-11d1-83ee-00a0c90dc849}")

/**
 * @type {Guid}
 */
export global CLSID_NetworkShare := Guid("{54a754c0-4bf0-11d1-83ee-00a0c90dc849}")

/**
 * @type {Guid}
 */
export global CLSID_MyComputer := Guid("{20d04fe0-3aea-1069-a2d8-08002b30309d}")

/**
 * @type {Guid}
 */
export global CLSID_Internet := Guid("{871c5380-42a0-1069-a2ea-08002b30309d}")

/**
 * @type {Guid}
 */
export global CLSID_RecycleBin := Guid("{645ff040-5081-101b-9f08-00aa002f954e}")

/**
 * @type {Guid}
 */
export global CLSID_ControlPanel := Guid("{21ec2020-3aea-1069-a2dd-08002b30309d}")

/**
 * @type {Guid}
 */
export global CLSID_Printers := Guid("{2227a280-3aea-1069-a2de-08002b30309d}")

/**
 * @type {Guid}
 */
export global CLSID_MyDocuments := Guid("{450d8fba-ad25-11d0-98a8-0800361b1103}")

/**
 * @type {String}
 */
export global STR_MYDOCS_CLSID := "{450D8FBA-AD25-11D0-98A8-0800361B1103}"

/**
 * @type {Guid}
 */
export global CATID_BrowsableShellExt := Guid("{00021490-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CATID_BrowseInPlace := Guid("{00021491-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CATID_DeskBand := Guid("{00021492-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CATID_InfoBand := Guid("{00021493-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CATID_CommBand := Guid("{00021494-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global FMTID_Intshcut := Guid("{000214a0-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global FMTID_InternetSite := Guid("{000214a1-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CGID_Explorer := Guid("{000214d0-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CGID_ShellDocView := Guid("{000214d1-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CGID_ShellServiceObject := Guid("{000214d2-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CGID_ExplorerBarDoc := Guid("{000214d3-0000-0000-c000-000000000046}")

/**
 * @type {Guid}
 */
export global CLSID_FolderShortcut := Guid("{0afaced1-e828-11d1-9187-b532f1e9575d}")

/**
 * @type {Guid}
 */
export global CLSID_CFSIconOverlayManager := Guid("{63b51f81-c868-11d0-999c-00c04fd655e1}")

/**
 * @type {Guid}
 */
export global CLSID_ShellThumbnailDiskCache := Guid("{1ebdcf80-a200-11d0-a3a4-00c04fd706ec}")

/**
 * @type {Guid}
 */
export global SID_DefView := Guid("{6d12fe80-7911-11cf-9534-0000c05bae0b}")

/**
 * @type {Guid}
 */
export global CGID_DefView := Guid("{4af07f10-d231-11d0-b942-00a0c90312e1}")

/**
 * @type {Guid}
 */
export global CLSID_MenuBand := Guid("{5b4dae26-b807-11d0-9815-00c04fd91972}")

/**
 * @type {Guid}
 */
export global VID_LargeIcons := Guid("{0057d0e0-3573-11cf-ae69-08002b2e1262}")

/**
 * @type {Guid}
 */
export global VID_SmallIcons := Guid("{089000c0-3573-11cf-ae69-08002b2e1262}")

/**
 * @type {Guid}
 */
export global VID_List := Guid("{0e1fa5e0-3573-11cf-ae69-08002b2e1262}")

/**
 * @type {Guid}
 */
export global VID_Details := Guid("{137e7700-3573-11cf-ae69-08002b2e1262}")

/**
 * @type {Guid}
 */
export global VID_Tile := Guid("{65f125e5-7be1-4810-ba9d-d271c8432ce3}")

/**
 * @type {Guid}
 */
export global VID_Content := Guid("{30c2c434-0889-4c8d-985d-a9f71830b0a9}")

/**
 * @type {Guid}
 */
export global VID_Thumbnails := Guid("{8bebb290-52d0-11d0-b7f4-00c04fd706ec}")

/**
 * @type {Guid}
 */
export global VID_ThumbStrip := Guid("{8eefa624-d1e9-445b-94b7-74fbce2ea11a}")

/**
 * @type {Guid}
 */
export global SID_SInPlaceBrowser := Guid("{1d2ae02b-3655-46cc-b63a-285988153bca}")

/**
 * @type {Guid}
 */
export global SID_SSearchBoxInfo := Guid("{142daa61-516b-4713-b49c-fb985ef82998}")

/**
 * @type {Guid}
 */
export global SID_CommandsPropertyBag := Guid("{6e043250-4416-485c-b143-e62a760d9fe5}")

/**
 * @type {Guid}
 */
export global CLSID_CURLSearchHook := Guid("{cfbfae00-17a6-11d0-99cb-00c04fd64497}")

/**
 * @type {Guid}
 */
export global CLSID_AutoComplete := Guid("{00bb2763-6a77-11d0-a535-00c04fd7d062}")

/**
 * @type {Guid}
 */
export global CLSID_ACLHistory := Guid("{00bb2764-6a77-11d0-a535-00c04fd7d062}")

/**
 * @type {Guid}
 */
export global CLSID_ACListISF := Guid("{03c036f1-a186-11d0-824a-00aa005b4383}")

/**
 * @type {Guid}
 */
export global CLSID_ACLMRU := Guid("{6756a641-de71-11d0-831b-00aa005b4383}")

/**
 * @type {Guid}
 */
export global CLSID_ACLMulti := Guid("{00bb2765-6a77-11d0-a535-00c04fd7d062}")

/**
 * @type {Guid}
 */
export global CLSID_ACLCustomMRU := Guid("{6935db93-21e8-4ccc-beb9-9fe3c77a297a}")

/**
 * @type {Guid}
 */
export global CLSID_ProgressDialog := Guid("{f8383852-fcd3-11d1-a6b9-006097df5bd4}")

/**
 * @type {Guid}
 */
export global SID_STopLevelBrowser := Guid("{4c96be40-915c-11cf-99d3-00aa004ae837}")

/**
 * @type {Guid}
 */
export global CLSID_FileTypes := Guid("{b091e540-83e3-11cf-a713-0020afd79762}")

/**
 * @type {Guid}
 */
export global CLSID_ActiveDesktop := Guid("{75048700-ef1f-11d0-9888-006097deacf9}")

/**
 * @type {Guid}
 */
export global CLSID_QueryAssociations := Guid("{a07034fd-6caa-4954-ac3f-97a27216f98a}")

/**
 * @type {Guid}
 */
export global CLSID_LinkColumnProvider := Guid("{24f14f02-7b1c-11d1-838f-0000f80461cf}")

/**
 * @type {Guid}
 */
export global CGID_ShortCut := Guid("{93a68750-951a-11d1-946f-000000000000}")

/**
 * @type {Guid}
 */
export global CLSID_InternetButtons := Guid("{1e796980-9cc5-11d1-a83f-00c04fc99d61}")

/**
 * @type {Guid}
 */
export global CLSID_MSOButtons := Guid("{178f34b8-a282-11d2-86c5-00c04f8eea99}")

/**
 * @type {Guid}
 */
export global CLSID_ToolbarExtButtons := Guid("{2ce4b5d8-a28f-11d2-86c5-00c04f8eea99}")

/**
 * @type {Guid}
 */
export global CLSID_DarwinAppPublisher := Guid("{cfccc7a0-a282-11d1-9082-006008059382}")

/**
 * @type {Guid}
 */
export global CLSID_DocHostUIHandler := Guid("{7057e952-bd1b-11d1-8919-00c04fc2c836}")

/**
 * @type {Guid}
 */
export global PSGUID_SHELLDETAILS := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")

/**
 * @type {Guid}
 */
export global FMTID_ShellDetails := Guid("{28636aa6-953d-11d2-b5d6-00c04fd918d0}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_FINDDATA := 0

/**
 * @type {Integer (UInt32)}
 */
export global PID_NETRESOURCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PID_DESCRIPTIONID := 2

/**
 * @type {Integer (UInt32)}
 */
export global PID_WHICHFOLDER := 3

/**
 * @type {Integer (UInt32)}
 */
export global PID_NETWORKLOCATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global PID_COMPUTERNAME := 5

/**
 * @type {Guid}
 */
export global FMTID_Storage := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")

/**
 * @type {Guid}
 */
export global PSGUID_IMAGEPROPERTIES := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")

/**
 * @type {Guid}
 */
export global FMTID_ImageProperties := Guid("{14b81da1-0135-4d31-96d9-6cbfc9671a99}")

/**
 * @type {Guid}
 */
export global PSGUID_CUSTOMIMAGEPROPERTIES := Guid("{7ecd8b0e-c136-4a9b-9411-4ebd6673ccc3}")

/**
 * @type {Guid}
 */
export global FMTID_CustomImageProperties := Guid("{7ecd8b0e-c136-4a9b-9411-4ebd6673ccc3}")

/**
 * @type {Guid}
 */
export global PSGUID_LIBRARYPROPERTIES := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")

/**
 * @type {Guid}
 */
export global FMTID_LibraryProperties := Guid("{5d76b67f-9b3d-44bb-b6ae-25da4f638a67}")

/**
 * @type {Guid}
 */
export global PSGUID_DISPLACED := Guid("{9b174b33-40ff-11d2-a27e-00c04fc30871}")

/**
 * @type {Guid}
 */
export global FMTID_Displaced := Guid("{9b174b33-40ff-11d2-a27e-00c04fc30871}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_DISPLACED_FROM := 2

/**
 * @type {Integer (UInt32)}
 */
export global PID_DISPLACED_DATE := 3

/**
 * @type {Guid}
 */
export global PSGUID_BRIEFCASE := Guid("{328d8b21-7729-4bfc-954c-902b329d56b0}")

/**
 * @type {Guid}
 */
export global FMTID_Briefcase := Guid("{328d8b21-7729-4bfc-954c-902b329d56b0}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_SYNC_COPY_IN := 2

/**
 * @type {Guid}
 */
export global PSGUID_MISC := Guid("{9b174b34-40ff-11d2-a27e-00c04fc30871}")

/**
 * @type {Guid}
 */
export global FMTID_Misc := Guid("{9b174b34-40ff-11d2-a27e-00c04fc30871}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_MISC_STATUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PID_MISC_ACCESSCOUNT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PID_MISC_OWNER := 4

/**
 * @type {Integer (UInt32)}
 */
export global PID_HTMLINFOTIPFILE := 5

/**
 * @type {Integer (UInt32)}
 */
export global PID_MISC_PICS := 6

/**
 * @type {Guid}
 */
export global PSGUID_WEBVIEW := Guid("{f2275480-f782-4291-bd94-f13693513aec}")

/**
 * @type {Guid}
 */
export global FMTID_WebView := Guid("{f2275480-f782-4291-bd94-f13693513aec}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_DISPLAY_PROPERTIES := 0

/**
 * @type {Integer (UInt32)}
 */
export global PID_INTROTEXT := 1

/**
 * @type {Guid}
 */
export global PSGUID_MUSIC := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")

/**
 * @type {Guid}
 */
export global FMTID_MUSIC := Guid("{56a3372e-ce9c-11d2-9f0e-006097c686f6}")

/**
 * @type {Integer (UInt32)}
 */
export global PIDSI_ARTIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIDSI_SONGTITLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PIDSI_ALBUM := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIDSI_YEAR := 5

/**
 * @type {Integer (UInt32)}
 */
export global PIDSI_COMMENT := 6

/**
 * @type {Integer (UInt32)}
 */
export global PIDSI_TRACK := 7

/**
 * @type {Integer (UInt32)}
 */
export global PIDSI_GENRE := 11

/**
 * @type {Integer (UInt32)}
 */
export global PIDSI_LYRICS := 12

/**
 * @type {Guid}
 */
export global PSGUID_DRM := Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}")

/**
 * @type {Guid}
 */
export global FMTID_DRM := Guid("{aeac19e4-89ae-4508-b9b7-bb867abee2ed}")

/**
 * @type {Integer (UInt32)}
 */
export global PIDDRSI_PROTECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIDDRSI_DESCRIPTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global PIDDRSI_PLAYCOUNT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIDDRSI_PLAYSTARTS := 5

/**
 * @type {Integer (UInt32)}
 */
export global PIDDRSI_PLAYEXPIRES := 6

/**
 * @type {Guid}
 */
export global PSGUID_VIDEO := Guid("{64440491-4c8b-11d1-8b70-080036b11a03}")

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_STREAM_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_FRAME_WIDTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_FRAME_HEIGHT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_TIMELENGTH := 7

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_FRAME_COUNT := 5

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_FRAME_RATE := 6

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_DATA_RATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_SAMPLE_SIZE := 9

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_COMPRESSION := 10

/**
 * @type {Integer (UInt32)}
 */
export global PIDVSI_STREAM_NUMBER := 11

/**
 * @type {Guid}
 */
export global PSGUID_AUDIO := Guid("{64440490-4c8b-11d1-8b70-080036b11a03}")

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_FORMAT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_TIMELENGTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_AVG_DATA_RATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_SAMPLE_RATE := 5

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_SAMPLE_SIZE := 6

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_CHANNEL_COUNT := 7

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_STREAM_NUMBER := 8

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_STREAM_NAME := 9

/**
 * @type {Integer (UInt32)}
 */
export global PIDASI_COMPRESSION := 10

/**
 * @type {Guid}
 */
export global PSGUID_CONTROLPANEL := Guid("{305ca226-d286-468e-b848-2b2e8e697b74}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONTROLPANEL_CATEGORY := 2

/**
 * @type {Guid}
 */
export global PSGUID_VOLUME := Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}")

/**
 * @type {Guid}
 */
export global FMTID_Volume := Guid("{9b174b35-40ff-11d2-a27e-00c04fc30871}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_VOLUME_FREE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PID_VOLUME_CAPACITY := 3

/**
 * @type {Integer (UInt32)}
 */
export global PID_VOLUME_FILESYSTEM := 4

/**
 * @type {Guid}
 */
export global PSGUID_SHARE := Guid("{d8c3986f-813b-449c-845d-87b95d674ade}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_SHARE_CSC_STATUS := 2

/**
 * @type {Guid}
 */
export global PSGUID_LINK := Guid("{b9b4b3fc-2b51-4a42-b5d8-324146afcf25}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_LINK_TARGET := 2

/**
 * @type {Integer (UInt32)}
 */
export global PID_LINK_TARGET_TYPE := 3

/**
 * @type {Guid}
 */
export global PSGUID_QUERY_D := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")

/**
 * @type {Guid}
 */
export global FMTID_Query := Guid("{49691c90-7e17-101a-a91c-08002b2ecda9}")

/**
 * @type {Integer (UInt32)}
 */
export global PID_QUERY_RANK := 2

/**
 * @type {Guid}
 */
export global PSGUID_SUMMARYINFORMATION := Guid("{f29f85e0-4ff9-1068-ab91-08002b27b3d9}")

/**
 * @type {Guid}
 */
export global PSGUID_DOCUMENTSUMMARYINFORMATION := Guid("{d5cdd502-2e9c-101b-9397-08002b2cf9ae}")

/**
 * @type {Guid}
 */
export global PSGUID_MEDIAFILESUMMARYINFORMATION := Guid("{64440492-4c8b-11d1-8b70-080036b11a03}")

/**
 * @type {Guid}
 */
export global PSGUID_IMAGESUMMARYINFORMATION := Guid("{6444048f-4c8b-11d1-8b70-080036b11a03}")

/**
 * @type {Guid}
 */
export global CLSID_HWShellExecute := Guid("{ffb8655f-81b9-4fce-b89c-9a6ba76d13e7}")

/**
 * @type {Guid}
 */
export global CLSID_DragDropHelper := Guid("{4657278a-411b-11d2-839a-00c04fd918d0}")

/**
 * @type {Guid}
 */
export global CLSID_CAnchorBrowsePropertyPage := Guid("{3050f3bb-98b5-11cf-bb82-00aa00bdce0b}")

/**
 * @type {Guid}
 */
export global CLSID_CImageBrowsePropertyPage := Guid("{3050f3b3-98b5-11cf-bb82-00aa00bdce0b}")

/**
 * @type {Guid}
 */
export global CLSID_CDocBrowsePropertyPage := Guid("{3050f3b4-98b5-11cf-bb82-00aa00bdce0b}")

/**
 * @type {Guid}
 */
export global SID_STopWindow := Guid("{49e1b500-4636-11d3-97f7-00c04f45d0b3}")

/**
 * @type {Guid}
 */
export global SID_SGetViewFromViewDual := Guid("{889a935d-971e-4b12-b90c-24dfc9e1e5e8}")

/**
 * @type {Guid}
 */
export global CLSID_FolderItemsMultiLevel := Guid("{53c74826-ab99-4d33-aca4-3117f51d3788}")

/**
 * @type {Guid}
 */
export global CLSID_NewMenu := Guid("{d969a300-e7ff-11d0-a93b-00a0c90f2719}")

/**
 * @type {Guid}
 */
export global BHID_SFObject := Guid("{3981e224-f559-11d3-8e3a-00c04f6837d5}")

/**
 * @type {Guid}
 */
export global BHID_SFUIObject := Guid("{3981e225-f559-11d3-8e3a-00c04f6837d5}")

/**
 * @type {Guid}
 */
export global BHID_SFViewObject := Guid("{3981e226-f559-11d3-8e3a-00c04f6837d5}")

/**
 * @type {Guid}
 */
export global BHID_Storage := Guid("{3981e227-f559-11d3-8e3a-00c04f6837d5}")

/**
 * @type {Guid}
 */
export global BHID_Stream := Guid("{1cebb3ab-7c10-499a-a417-92ca16c4cb83}")

/**
 * @type {Guid}
 */
export global BHID_RandomAccessStream := Guid("{f16fc93b-77ae-4cfe-bda7-a866eea6878d}")

/**
 * @type {Guid}
 */
export global BHID_LinkTargetItem := Guid("{3981e228-f559-11d3-8e3a-00c04f6837d5}")

/**
 * @type {Guid}
 */
export global BHID_StorageEnum := Guid("{4621a4e3-f0d6-4773-8a9c-46e77b174840}")

/**
 * @type {Guid}
 */
export global BHID_Transfer := Guid("{d5e346a1-f753-4932-b403-4574800e2498}")

/**
 * @type {Guid}
 */
export global BHID_PropertyStore := Guid("{0384e1a4-1523-439c-a4c8-ab911052f586}")

/**
 * @type {Guid}
 */
export global BHID_ThumbnailHandler := Guid("{7b2e650a-8e20-4f4a-b09e-6597afc72fb0}")

/**
 * @type {Guid}
 */
export global BHID_EnumItems := Guid("{94f60519-2850-4924-aa5a-d15e84868039}")

/**
 * @type {Guid}
 */
export global BHID_DataObject := Guid("{b8c0bd9f-ed24-455c-83e6-d5390c4fe8c4}")

/**
 * @type {Guid}
 */
export global BHID_AssociationArray := Guid("{bea9ef17-82f1-4f60-9284-4f8db75c3be9}")

/**
 * @type {Guid}
 */
export global BHID_Filter := Guid("{38d08778-f557-4690-9ebf-ba54706ad8f7}")

/**
 * @type {Guid}
 */
export global BHID_EnumAssocHandlers := Guid("{b8ab0b9c-c2ec-4f7a-918d-314900e6280a}")

/**
 * @type {Guid}
 */
export global BHID_StorageItem := Guid("{404e2109-77d2-4699-a5a0-4fdf10db9837}")

/**
 * @type {Guid}
 */
export global BHID_FilePlaceholder := Guid("{8677dceb-aae0-4005-8d3d-547fa852f825}")

/**
 * @type {Guid}
 */
export global CATID_FilePlaceholderMergeHandler := Guid("{3e9c9a51-d4aa-4870-b47c-7424b491f1cc}")

/**
 * @type {Guid}
 */
export global SID_CtxQueryAssociations := Guid("{faadfc40-b777-4b69-aa81-77035ef0e6e8}")

/**
 * @type {Guid}
 */
export global CLSID_QuickLinks := Guid("{0e5cbf21-d15f-11d0-8301-00aa005b4383}")

/**
 * @type {Guid}
 */
export global CLSID_ISFBand := Guid("{d82be2b0-5764-11d0-a96e-00c04fd705a2}")

/**
 * @type {Guid}
 */
export global CLSID_ShellFldSetExt := Guid("{6d5313c0-8c62-11d1-b2cd-006097df8c11}")

/**
 * @type {Guid}
 */
export global SID_SMenuBandChild := Guid("{ed9cc020-08b9-11d1-9823-00c04fd91972}")

/**
 * @type {Guid}
 */
export global SID_SMenuBandParent := Guid("{8c278eec-3eab-11d1-8cb0-00c04fd918d0}")

/**
 * @type {Guid}
 */
export global SID_SMenuPopup := Guid("{d1e7afeb-6a2e-11d0-8c78-00c04fd918b4}")

/**
 * @type {Guid}
 */
export global SID_SMenuBandBottomSelected := Guid("{165ebaf4-6d51-11d2-83ad-00c04fd918d0}")

/**
 * @type {Guid}
 */
export global SID_SMenuBandBottom := Guid("{743ca664-0deb-11d1-9825-00c04fd91972}")

/**
 * @type {Guid}
 */
export global SID_MenuShellFolder := Guid("{a6c17eb4-2d65-11d2-838f-00c04fd918d0}")

/**
 * @type {Guid}
 */
export global SID_SMenuBandContextMenuModifier := Guid("{39545874-7162-465e-b783-2aa1874fef81}")

/**
 * @type {Guid}
 */
export global SID_SMenuBandBKContextMenu := Guid("{164bbd86-1d0d-4de0-9a3b-d9729647c2b8}")

/**
 * @type {Guid}
 */
export global CGID_MENUDESKBAR := Guid("{5c9f0a12-959e-11d0-a3a4-00a0c9082636}")

/**
 * @type {Guid}
 */
export global SID_SMenuBandTop := Guid("{9493a810-ec38-11d0-bc46-00aa006ce2f5}")

/**
 * @type {Guid}
 */
export global CLSID_MenuToolbarBase := Guid("{40b96610-b522-11d1-b3b4-00aa006efde7}")

/**
 * @type {Guid}
 */
export global CLSID_MenuBandSite := Guid("{e13ef4e4-d2f2-11d0-9816-00c04fd91972}")

/**
 * @type {Guid}
 */
export global SID_SCommDlgBrowser := Guid("{80f30233-b7df-11d2-a33b-006097df5bd4}")

/**
 * @type {Guid}
 */
export global CPFG_LOGON_USERNAME := Guid("{da15bbe8-954d-4fd3-b0f4-1fb5b90b174b}")

/**
 * @type {Guid}
 */
export global CPFG_LOGON_PASSWORD := Guid("{60624cfa-a477-47b1-8a8e-3a4a19981827}")

/**
 * @type {Guid}
 */
export global CPFG_SMARTCARD_USERNAME := Guid("{3e1ecf69-568c-4d96-9d59-46444174e2d6}")

/**
 * @type {Guid}
 */
export global CPFG_SMARTCARD_PIN := Guid("{4fe5263b-9181-46c1-b0a4-9dedd4db7dea}")

/**
 * @type {Guid}
 */
export global CPFG_CREDENTIAL_PROVIDER_LOGO := Guid("{2d837775-f6cd-464e-a745-482fd0b47493}")

/**
 * @type {Guid}
 */
export global CPFG_CREDENTIAL_PROVIDER_LABEL := Guid("{286bbff3-bad4-438f-b007-79b7267c3d48}")

/**
 * @type {Guid}
 */
export global CPFG_STANDALONE_SUBMIT_BUTTON := Guid("{0b7b0ad8-cc36-4d59-802b-82f714fa7022}")

/**
 * @type {Guid}
 */
export global CPFG_STYLE_LINK_AS_BUTTON := Guid("{088fa508-94a6-4430-a4cb-6fc6e3c0b9e2}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Invalid := Guid("{57807898-8c4f-4462-bb63-71042380b109}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Generic := Guid("{5c4f28b5-f869-4e84-8e60-f11db97c5cc7}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_GenericSearchResults := Guid("{7fde1a1e-8b31-49a5-93b8-6be14cfa4943}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_GenericLibrary := Guid("{5f4eab9a-6833-4f61-899d-31cf46979d49}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Documents := Guid("{7d49d726-3c21-4f05-99aa-fdc2c9474656}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Pictures := Guid("{b3690e58-e961-423b-b687-386ebfd83239}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Music := Guid("{94d6ddcc-4a68-4175-a374-bd584a510b78}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Videos := Guid("{5fa96407-7e77-483c-ac93-691d05850de8}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Downloads := Guid("{885a186e-a440-4ada-812b-db871b942259}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_UserFiles := Guid("{cd0fc69b-71e2-46e5-9690-5bcd9f57aab3}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_UsersLibraries := Guid("{c4d98f09-6124-4fe0-9942-826416082da9}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_OtherUsers := Guid("{b337fd00-9dd5-4635-a6d4-da33fd102b7a}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_PublishedItems := Guid("{7f2f5b96-ff74-41da-afd8-1c78a5f3aea2}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Communications := Guid("{91475fe5-586b-4eba-8d75-d17434b8cdf6}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Contacts := Guid("{de2b70ec-9bf7-4a93-bd3d-243f7881d492}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_StartMenu := Guid("{ef87b4cb-f2ce-4785-8658-4ca6c63e38c6}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_RecordedTV := Guid("{5557a28f-5da6-4f83-8809-c2c98a11a6fa}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_SavedGames := Guid("{d0363307-28cb-4106-9f23-2956e3e5e0e7}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_OpenSearch := Guid("{8faf9629-1980-46ff-8023-9dceab9c3ee3}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_SearchConnector := Guid("{982725ee-6f47-479e-b447-812bfa7d2e8f}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_AccountPictures := Guid("{db2a5d8f-06e6-4007-aba6-af877d526ea6}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Games := Guid("{b689b0d0-76d3-4cbb-87f7-585d0e0ce070}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_ControlPanelCategory := Guid("{de4f0660-fa10-4b8f-a494-068b20b22307}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_ControlPanelClassic := Guid("{0c3794f3-b545-43aa-a329-c37430c58d2a}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Printers := Guid("{2c7bbec6-c844-4a0a-91fa-cef6f59cfda1}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_RecycleBin := Guid("{d6d9e004-cd87-442b-9d57-5e0aeb4f6f72}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_SoftwareExplorer := Guid("{d674391b-52d9-4e07-834e-67c98610f39d}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_CompressedFolder := Guid("{80213e82-bcfd-4c4f-8817-bb27601267a9}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_NetworkExplorer := Guid("{25cc242b-9a7c-4f51-80e0-7a2928febe42}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_Searches := Guid("{0b0ba2e3-405f-415e-a6ee-cad625207853}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_SearchHome := Guid("{834d8a44-0974-4ed6-866e-f203d80b3810}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_StorageProviderGeneric := Guid("{4f01ebc5-2385-41f2-a28e-2c5c91fb56e0}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_StorageProviderDocuments := Guid("{dd61bd66-70e8-48dd-9655-65c5e1aac2d1}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_StorageProviderPictures := Guid("{71d642a9-f2b1-42cd-ad92-eb9300c7cc0a}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_StorageProviderMusic := Guid("{672ecd7e-af04-4399-875c-0290845b6247}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_StorageProviderVideos := Guid("{51294da1-d7b1-485b-9e9a-17cffe33e187}")

/**
 * @type {Guid}
 */
export global FOLDERTYPEID_VersionControl := Guid("{69f1e26b-ec64-4280-bc83-f1eb887ec35a}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_Icon := Guid("{6dbc85c3-5d07-4c72-a777-7fec78072c06}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_EventStore := Guid("{4bef34b9-a786-4075-ba88-0c2b9d89a98f}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_ConflictStore := Guid("{d78181f4-2389-47e4-a960-60bcc2ed930b}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_BrowseContent := Guid("{57cbb584-e9b4-47ae-a120-c4df3335dee2}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_ShowSchedule := Guid("{edc6f3e3-8441-4109-adf3-6c1ca0b7de47}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_QueryBeforeActivate := Guid("{d882d80b-e7aa-49ed-86b7-e6e1f714cdfe}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_QueryBeforeDeactivate := Guid("{a0efc282-60e0-460e-9374-ea88513cfc80}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_QueryBeforeEnable := Guid("{04cbf7f0-5beb-4de1-bc90-908345c480f6}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_QueryBeforeDisable := Guid("{bb5f64aa-f004-4eb5-8e4d-26751966344c}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_QueryBeforeDelete := Guid("{f76c3397-afb3-45d7-a59f-5a49e905437e}")

/**
 * @type {Guid}
 */
export global SYNCMGR_OBJECTID_EventLinkClick := Guid("{2203bdc1-1af1-4082-8c30-28399f41384c}")

/**
 * @type {Guid}
 */
export global EP_NavPane := Guid("{cb316b22-25f7-42b8-8a09-540d23a43c2f}")

/**
 * @type {Guid}
 */
export global EP_Commands := Guid("{d9745868-ca5f-4a76-91cd-f5a129fbb076}")

/**
 * @type {Guid}
 */
export global EP_Commands_Organize := Guid("{72e81700-e3ec-4660-bf24-3c3b7b648806}")

/**
 * @type {Guid}
 */
export global EP_Commands_View := Guid("{21f7c32d-eeaa-439b-bb51-37b96fd6a943}")

/**
 * @type {Guid}
 */
export global EP_DetailsPane := Guid("{43abf98b-89b8-472d-b9ce-e69b8229f019}")

/**
 * @type {Guid}
 */
export global EP_PreviewPane := Guid("{893c63d1-45c8-4d17-be19-223be71be365}")

/**
 * @type {Guid}
 */
export global EP_QueryPane := Guid("{65bcde4f-4f07-4f27-83a7-1afca4df7ddd}")

/**
 * @type {Guid}
 */
export global EP_AdvQueryPane := Guid("{b4e9db8b-34ba-4c39-b5cc-16a1bd2c411c}")

/**
 * @type {Guid}
 */
export global EP_StatusBar := Guid("{65fe56ce-5cfe-4bc4-ad8a-7ae3fe7e8f7c}")

/**
 * @type {Guid}
 */
export global EP_Ribbon := Guid("{d27524a8-c9f2-4834-a106-df8889fd4f37}")

/**
 * @type {Guid}
 */
export global CATID_LocationFactory := Guid("{965c4d51-8b76-4e57-80b7-564d2ea4b55e}")

/**
 * @type {Guid}
 */
export global CATID_LocationProvider := Guid("{1b3ca474-2614-414b-b813-1aceca3e3dd8}")

/**
 * @type {Guid}
 */
export global ItemCount_Property_GUID := Guid("{abbf5c45-5ccc-47b7-bb4e-87cb87bbd162}")

/**
 * @type {Guid}
 */
export global SelectedItemCount_Property_GUID := Guid("{8fe316d2-0e52-460a-9c1e-48f273d470a3}")

/**
 * @type {Guid}
 */
export global ItemIndex_Property_GUID := Guid("{92a053da-2969-4021-bf27-514cfc2e4a69}")

/**
 * @type {Guid}
 */
export global CATID_SearchableApplication := Guid("{366c292a-d9b3-4dbf-bb70-e62ec3d0bbbf}")

/**
 * @type {Integer (UInt32)}
 */
export global IDD_WIZEXTN_FIRST := 20480

/**
 * @type {Integer (UInt32)}
 */
export global IDD_WIZEXTN_LAST := 20736

/**
 * @type {Integer (UInt32)}
 */
export global SHPWHF_NORECOMPRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHPWHF_NONETPLACECREATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHPWHF_NOFILESELECTOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHPWHF_USEMRU := 8

/**
 * @type {Integer (UInt32)}
 */
export global SHPWHF_ANYLOCATION := 256

/**
 * @type {Integer (UInt32)}
 */
export global SHPWHF_VALIDATEVIAWEBFOLDERS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ACDD_VISIBLE := 1

/**
 * @type {String}
 */
export global PROPSTR_EXTENSIONCOMPLETIONSTATE := "ExtensionCompletionState"

/**
 * @type {Guid}
 */
export global SID_SCommandBarState := Guid("{b99eaa5c-3850-4400-bc33-2ce534048bf8}")

/**
 * @type {Integer (Int32)}
 */
export global NSTCDHPOS_ONTOP := -1

/**
 * @type {Integer (UInt32)}
 */
export global FVSIF_RECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FVSIF_PINNED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FVSIF_NEWFAILED := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global FVSIF_NEWFILE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global FVSIF_CANVIEWIT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_TOOLBAR := 40960

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_STATUS := 40961

/**
 * @type {Integer (UInt32)}
 */
export global IDC_OFFLINE_HAND := 103

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PANTOOL_HAND_OPEN := 104

/**
 * @type {Integer (UInt32)}
 */
export global IDC_PANTOOL_HAND_CLOSED := 105

/**
 * @type {Integer (UInt32)}
 */
export global PANE_NONE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global PANE_ZONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PANE_OFFLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PANE_PRINTER := 3

/**
 * @type {Integer (UInt32)}
 */
export global PANE_SSL := 4

/**
 * @type {Integer (UInt32)}
 */
export global PANE_NAVIGATION := 5

/**
 * @type {Integer (UInt32)}
 */
export global PANE_PROGRESS := 6

/**
 * @type {Integer (UInt32)}
 */
export global PANE_PRIVACY := 7

/**
 * @type {Integer (UInt32)}
 */
export global DWFRF_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DWFRF_DELETECONFIGDATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global DWFAF_HIDDEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DWFAF_GROUP1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DWFAF_GROUP2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DWFAF_AUTOHIDE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SHIMSTCAPFLAG_LOCKABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHIMSTCAPFLAG_PURGEABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_MASK_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_MASK_BKCOLOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_MASK_VIEWMODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_MASK_SHELLFOLDER := 8

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_MASK_IDLIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_MASK_COLORS := 32

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_DEBOSSED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_ALLOWRENAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_NOSHOWTEXT := 4

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_CHANNELBAR := 16

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_QLINKSMODE := 32

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_FULLOPEN := 64

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_NONAMESORT := 128

/**
 * @type {Integer (UInt32)}
 */
export global ISFB_STATE_BTNMINSIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global ISFBVIEWMODE_SMALLICONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISFBVIEWMODE_LARGEICONS := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISFBVIEWMODE_LOGOS := 3

/**
 * @type {Integer (UInt32)}
 */
export global DBC_GS_IDEAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DBC_GS_SIZEDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBC_HIDE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DBC_SHOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBC_SHOWOBSCURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSM_CLEAR := 0

/**
 * @type {Integer (UInt32)}
 */
export global SSM_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSM_REFRESH := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSM_UPDATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCHEME_DISPLAY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCHEME_EDIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCHEME_LOCAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCHEME_GLOBAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global SCHEME_REFRESH := 16

/**
 * @type {Integer (UInt32)}
 */
export global SCHEME_UPDATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SCHEME_DONOTUSE := 64

/**
 * @type {Integer (UInt32)}
 */
export global SCHEME_CREATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global GADOF_DIRTY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHCDF_UPDATEITEM := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPCF_ADDQUOTES := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPCF_ADDARGUMENTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global PPCF_NODIRECTORIES := 16

/**
 * @type {Integer (UInt32)}
 */
export global PPCF_FORCEQUALIFY := 64

/**
 * @type {Integer (UInt32)}
 */
export global PPCF_LONGESTPOSSIBLE := 128

/**
 * @type {Integer (UInt32)}
 */
export global OPENPROPS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global OPENPROPS_INHIBITPIF := 32768

/**
 * @type {Integer (UInt32)}
 */
export global GETPROPS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SETPROPS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLOSEPROPS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLOSEPROPS_DISCARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBIF_APPEND := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBIF_PREPEND := 1

/**
 * @type {Integer (UInt32)}
 */
export global TBIF_REPLACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TBIF_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TBIF_INTERNETBAR := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TBIF_STANDARDTOOLBAR := 131072

/**
 * @type {Integer (UInt32)}
 */
export global TBIF_NOTOOLBAR := 196608

/**
 * @type {Integer (UInt32)}
 */
export global SFVM_REARRANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SFVM_ADDOBJECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global SFVM_REMOVEOBJECT := 6

/**
 * @type {Integer (UInt32)}
 */
export global SFVM_UPDATEOBJECT := 7

/**
 * @type {Integer (UInt32)}
 */
export global SFVM_GETSELECTEDOBJECTS := 9

/**
 * @type {Integer (UInt32)}
 */
export global SFVM_SETITEMPOS := 14

/**
 * @type {Integer (UInt32)}
 */
export global SFVM_SETCLIPBOARD := 16

/**
 * @type {Integer (UInt32)}
 */
export global SFVM_SETPOINTS := 23

/**
 * @type {Integer (UInt32)}
 */
export global GIL_OPENICON := 1

/**
 * @type {Integer (UInt32)}
 */
export global GIL_FORSHELL := 2

/**
 * @type {Integer (UInt32)}
 */
export global GIL_ASYNC := 32

/**
 * @type {Integer (UInt32)}
 */
export global GIL_DEFAULTICON := 64

/**
 * @type {Integer (UInt32)}
 */
export global GIL_FORSHORTCUT := 128

/**
 * @type {Integer (UInt32)}
 */
export global GIL_CHECKSHIELD := 512

/**
 * @type {Integer (UInt32)}
 */
export global GIL_SIMULATEDOC := 1

/**
 * @type {Integer (UInt32)}
 */
export global GIL_PERINSTANCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global GIL_PERCLASS := 4

/**
 * @type {Integer (UInt32)}
 */
export global GIL_NOTFILENAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global GIL_DONTCACHE := 16

/**
 * @type {Integer (UInt32)}
 */
export global GIL_SHIELD := 512

/**
 * @type {Integer (UInt32)}
 */
export global GIL_FORCENOSHIELD := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SIOM_OVERLAYINDEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIOM_ICONINDEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global SIOM_RESERVED_SHARED := 0

/**
 * @type {Integer (UInt32)}
 */
export global SIOM_RESERVED_LINK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIOM_RESERVED_SLOWFILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SIOM_RESERVED_DEFAULT := 3

/**
 * @type {Integer (UInt32)}
 */
export global OI_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global OI_ASYNC := 4294962926

/**
 * @type {Integer (UInt32)}
 */
export global IDO_SHGIOI_SHARE := 268435455

/**
 * @type {Integer (UInt32)}
 */
export global IDO_SHGIOI_LINK := 268435454

/**
 * @type {Integer (UInt64)}
 */
export global IDO_SHGIOI_SLOWFILE := 4294967293

/**
 * @type {Integer (UInt64)}
 */
export global IDO_SHGIOI_DEFAULT := 4294967292

/**
 * @type {Integer (UInt32)}
 */
export global NT_CONSOLE_PROPS_SIG := 2684354562

/**
 * @type {Integer (UInt32)}
 */
export global NT_FE_CONSOLE_PROPS_SIG := 2684354564

/**
 * @type {Integer (UInt32)}
 */
export global EXP_DARWIN_ID_SIG := 2684354566

/**
 * @type {Integer (UInt32)}
 */
export global EXP_SPECIAL_FOLDER_SIG := 2684354565

/**
 * @type {Integer (UInt32)}
 */
export global EXP_SZ_LINK_SIG := 2684354561

/**
 * @type {Integer (UInt32)}
 */
export global EXP_SZ_ICON_SIG := 2684354567

/**
 * @type {Integer (UInt32)}
 */
export global EXP_PROPERTYSTORAGE_SIG := 2684354569

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_SHVIEWFIRST := 0

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_SHVIEWLAST := 32767

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_BROWSERFIRST := 40960

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_BROWSERLAST := 48896

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_GLOBALFIRST := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_GLOBALLAST := 40959

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_FILE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_EDIT := 32832

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_VIEW := 32896

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_VIEW_SEP_OPTIONS := 32897

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_TOOLS := 32960

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_TOOLS_SEP_GOTO := 32961

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_HELP := 33024

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_FIND := 33088

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_EXPLORE := 33104

/**
 * @type {Integer (UInt32)}
 */
export global FCIDM_MENU_FAVORITES := 33136

/**
 * @type {Integer (UInt32)}
 */
export global OFASI_EDIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global OFASI_OPENDESKTOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_DESKTOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_INTERNET := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PROGRAMS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_CONTROLS := 3

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PRINTERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PERSONAL := 5

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FAVORITES := 6

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_STARTUP := 7

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_RECENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_SENDTO := 9

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_BITBUCKET := 10

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_STARTMENU := 11

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_MYDOCUMENTS := 5

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_MYMUSIC := 13

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_MYVIDEO := 14

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_DESKTOPDIRECTORY := 16

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_DRIVES := 17

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_NETWORK := 18

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_NETHOOD := 19

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FONTS := 20

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_TEMPLATES := 21

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_STARTMENU := 22

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_PROGRAMS := 23

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_STARTUP := 24

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_DESKTOPDIRECTORY := 25

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_APPDATA := 26

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PRINTHOOD := 27

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_LOCAL_APPDATA := 28

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_ALTSTARTUP := 29

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_ALTSTARTUP := 30

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_FAVORITES := 31

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_INTERNET_CACHE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COOKIES := 33

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_HISTORY := 34

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_APPDATA := 35

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_WINDOWS := 36

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_SYSTEM := 37

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PROGRAM_FILES := 38

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_MYPICTURES := 39

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PROFILE := 40

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_SYSTEMX86 := 41

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PROGRAM_FILESX86 := 42

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PROGRAM_FILES_COMMON := 43

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_PROGRAM_FILES_COMMONX86 := 44

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_TEMPLATES := 45

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_DOCUMENTS := 46

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_ADMINTOOLS := 47

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_ADMINTOOLS := 48

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_CONNECTIONS := 49

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_MUSIC := 53

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_PICTURES := 54

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_VIDEO := 55

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_RESOURCES := 56

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_RESOURCES_LOCALIZED := 57

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMMON_OEM_LINKS := 58

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_CDBURN_AREA := 59

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_COMPUTERSNEARME := 61

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FLAG_CREATE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FLAG_DONT_VERIFY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FLAG_DONT_UNEXPAND := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FLAG_NO_ALIAS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FLAG_PER_USER_INIT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FLAG_MASK := 65280

/**
 * @type {Integer (UInt32)}
 */
export global FCS_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global FCS_FORCEWRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FCS_FLAG_DRAGDROP := 2

/**
 * @type {Integer (UInt32)}
 */
export global FCSM_VIEWID := 1

/**
 * @type {Integer (UInt32)}
 */
export global FCSM_WEBVIEWTEMPLATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FCSM_INFOTIP := 4

/**
 * @type {Integer (UInt32)}
 */
export global FCSM_CLSID := 8

/**
 * @type {Integer (UInt32)}
 */
export global FCSM_ICONFILE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FCSM_LOGO := 32

/**
 * @type {Integer (UInt32)}
 */
export global FCSM_FLAGS := 64

/**
 * @type {Integer (UInt32)}
 */
export global BIF_RETURNONLYFSDIRS := 1

/**
 * @type {Integer (UInt32)}
 */
export global BIF_DONTGOBELOWDOMAIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global BIF_STATUSTEXT := 4

/**
 * @type {Integer (UInt32)}
 */
export global BIF_RETURNFSANCESTORS := 8

/**
 * @type {Integer (UInt32)}
 */
export global BIF_EDITBOX := 16

/**
 * @type {Integer (UInt32)}
 */
export global BIF_VALIDATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global BIF_NEWDIALOGSTYLE := 64

/**
 * @type {Integer (UInt32)}
 */
export global BIF_BROWSEINCLUDEURLS := 128

/**
 * @type {Integer (UInt32)}
 */
export global BIF_UAHINT := 256

/**
 * @type {Integer (UInt32)}
 */
export global BIF_NONEWFOLDERBUTTON := 512

/**
 * @type {Integer (UInt32)}
 */
export global BIF_NOTRANSLATETARGETS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global BIF_BROWSEFORCOMPUTER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global BIF_BROWSEFORPRINTER := 8192

/**
 * @type {Integer (UInt32)}
 */
export global BIF_BROWSEINCLUDEFILES := 16384

/**
 * @type {Integer (UInt32)}
 */
export global BIF_SHAREABLE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global BIF_BROWSEFILEJUNCTIONS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_INITIALIZED := 1

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SELCHANGED := 2

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_VALIDATEFAILEDA := 3

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_VALIDATEFAILEDW := 4

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_IUNKNOWN := 5

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SETSTATUSTEXTA := 1124

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_ENABLEOK := 1125

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SETSELECTIONA := 1126

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SETSELECTIONW := 1127

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SETSTATUSTEXTW := 1128

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SETOKTEXT := 1129

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SETEXPANDED := 1130

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SETSTATUSTEXT := 1128

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_SETSELECTION := 1127

/**
 * @type {Integer (UInt32)}
 */
export global BFFM_VALIDATEFAILED := 4

/**
 * @type {Integer (Int32)}
 */
export global CMDID_INTSHORTCUTCREATE := 1

/**
 * @type {String}
 */
export global STR_PARSE_WITH_PROPERTIES := "ParseWithProperties"

/**
 * @type {String}
 */
export global STR_PARSE_PARTIAL_IDLIST := "ParseOriginalItem"

/**
 * @type {Integer (UInt32)}
 */
export global PROGDLG_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PROGDLG_MODAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROGDLG_AUTOTIME := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROGDLG_NOTIME := 4

/**
 * @type {Integer (UInt32)}
 */
export global PROGDLG_NOMINIMIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PROGDLG_NOPROGRESSBAR := 16

/**
 * @type {Integer (UInt32)}
 */
export global PROGDLG_MARQUEEPROGRESS := 32

/**
 * @type {Integer (UInt32)}
 */
export global PROGDLG_NOCANCEL := 64

/**
 * @type {Integer (UInt32)}
 */
export global PDTIMER_RESET := 1

/**
 * @type {Integer (UInt32)}
 */
export global PDTIMER_PAUSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PDTIMER_RESUME := 3

/**
 * @type {Integer (UInt32)}
 */
export global COMPONENT_TOP := 1073741823

/**
 * @type {Integer (UInt32)}
 */
export global COMP_TYPE_HTMLDOC := 0

/**
 * @type {Integer (UInt32)}
 */
export global COMP_TYPE_PICTURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global COMP_TYPE_WEBSITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global COMP_TYPE_CONTROL := 3

/**
 * @type {Integer (UInt32)}
 */
export global COMP_TYPE_CFHTML := 4

/**
 * @type {Integer (UInt32)}
 */
export global COMP_TYPE_MAX := 4

/**
 * @type {Integer (UInt32)}
 */
export global IS_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global IS_FULLSCREEN := 2

/**
 * @type {Integer (UInt32)}
 */
export global IS_SPLIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global AD_APPLY_SAVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AD_APPLY_HTMLGEN := 2

/**
 * @type {Integer (UInt32)}
 */
export global AD_APPLY_REFRESH := 4

/**
 * @type {Integer (UInt32)}
 */
export global AD_APPLY_FORCE := 8

/**
 * @type {Integer (UInt32)}
 */
export global AD_APPLY_BUFFERED_REFRESH := 16

/**
 * @type {Integer (UInt32)}
 */
export global AD_APPLY_DYNAMICREFRESH := 32

/**
 * @type {Integer (UInt32)}
 */
export global AD_GETWP_BMP := 0

/**
 * @type {Integer (UInt32)}
 */
export global AD_GETWP_IMAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AD_GETWP_LAST_APPLIED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WPSTYLE_CENTER := 0

/**
 * @type {Integer (UInt32)}
 */
export global WPSTYLE_TILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WPSTYLE_STRETCH := 2

/**
 * @type {Integer (UInt32)}
 */
export global WPSTYLE_KEEPASPECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global WPSTYLE_CROPTOFIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WPSTYLE_SPAN := 5

/**
 * @type {Integer (UInt32)}
 */
export global WPSTYLE_MAX := 6

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_CHECKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_DIRTY := 4

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_NOSCROLL := 8

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_POS_LEFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_POS_TOP := 32

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_SIZE_WIDTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_SIZE_HEIGHT := 128

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_POS_ZINDEX := 256

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_SOURCE := 512

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_FRIENDLYNAME := 1024

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_SUBSCRIBEDURL := 2048

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_ORIGINAL_CSI := 4096

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_RESTORED_CSI := 8192

/**
 * @type {Integer (UInt32)}
 */
export global COMP_ELEM_CURITEMSTATE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ADDURL_SILENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global COMPONENT_DEFAULT_LEFT := 65535

/**
 * @type {Integer (UInt32)}
 */
export global COMPONENT_DEFAULT_TOP := 65535

/**
 * @type {Integer (UInt32)}
 */
export global MAX_COLUMN_NAME_LEN := 80

/**
 * @type {Integer (UInt32)}
 */
export global MAX_COLUMN_DESC_LEN := 128

/**
 * @type {String}
 */
export global CFSTR_SHELLIDLIST := "Shell IDList Array"

/**
 * @type {String}
 */
export global CFSTR_SHELLIDLISTOFFSET := "Shell Object Offsets"

/**
 * @type {String}
 */
export global CFSTR_NETRESOURCES := "Net Resource"

/**
 * @type {String}
 */
export global CFSTR_FILEDESCRIPTORA := "FileGroupDescriptor"

/**
 * @type {String}
 */
export global CFSTR_FILEDESCRIPTORW := "FileGroupDescriptorW"

/**
 * @type {String}
 */
export global CFSTR_FILECONTENTS := "FileContents"

/**
 * @type {String}
 */
export global CFSTR_FILENAMEA := "FileName"

/**
 * @type {String}
 */
export global CFSTR_FILENAMEW := "FileNameW"

/**
 * @type {String}
 */
export global CFSTR_PRINTERGROUP := "PrinterFriendlyName"

/**
 * @type {String}
 */
export global CFSTR_FILENAMEMAPA := "FileNameMap"

/**
 * @type {String}
 */
export global CFSTR_FILENAMEMAPW := "FileNameMapW"

/**
 * @type {String}
 */
export global CFSTR_SHELLURL := "UniformResourceLocator"

/**
 * @type {String}
 */
export global CFSTR_INETURLA := "UniformResourceLocator"

/**
 * @type {String}
 */
export global CFSTR_INETURLW := "UniformResourceLocatorW"

/**
 * @type {String}
 */
export global CFSTR_PREFERREDDROPEFFECT := "Preferred DropEffect"

/**
 * @type {String}
 */
export global CFSTR_PERFORMEDDROPEFFECT := "Performed DropEffect"

/**
 * @type {String}
 */
export global CFSTR_PASTESUCCEEDED := "Paste Succeeded"

/**
 * @type {String}
 */
export global CFSTR_INDRAGLOOP := "InShellDragLoop"

/**
 * @type {String}
 */
export global CFSTR_MOUNTEDVOLUME := "MountedVolume"

/**
 * @type {String}
 */
export global CFSTR_PERSISTEDDATAOBJECT := "PersistedDataObject"

/**
 * @type {String}
 */
export global CFSTR_TARGETCLSID := "TargetCLSID"

/**
 * @type {String}
 */
export global CFSTR_LOGICALPERFORMEDDROPEFFECT := "Logical Performed DropEffect"

/**
 * @type {String}
 */
export global CFSTR_AUTOPLAY_SHELLIDLISTS := "Autoplay Enumerated IDList Array"

/**
 * @type {String}
 */
export global CFSTR_UNTRUSTEDDRAGDROP := "UntrustedDragDrop"

/**
 * @type {String}
 */
export global CFSTR_FILE_ATTRIBUTES_ARRAY := "File Attributes Array"

/**
 * @type {String}
 */
export global CFSTR_INVOKECOMMAND_DROPPARAM := "InvokeCommand DropParam"

/**
 * @type {String}
 */
export global CFSTR_SHELLDROPHANDLER := "DropHandlerCLSID"

/**
 * @type {String}
 */
export global CFSTR_DROPDESCRIPTION := "DropDescription"

/**
 * @type {String}
 */
export global CFSTR_ZONEIDENTIFIER := "ZoneIdentifier"

/**
 * @type {String}
 */
export global CFSTR_FILEDESCRIPTOR := "FileGroupDescriptorW"

/**
 * @type {String}
 */
export global CFSTR_FILENAME := "FileNameW"

/**
 * @type {String}
 */
export global CFSTR_FILENAMEMAP := "FileNameMapW"

/**
 * @type {String}
 */
export global CFSTR_INETURL := "UniformResourceLocatorW"

/**
 * @type {Integer (UInt32)}
 */
export global DVASPECT_SHORTNAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global DVASPECT_COPY := 3

/**
 * @type {Integer (UInt32)}
 */
export global DVASPECT_LINK := 4

/**
 * @type {Integer (Int32)}
 */
export global SHCNEE_ORDERCHANGED := 2

/**
 * @type {Integer (Int32)}
 */
export global SHCNEE_MSI_CHANGE := 4

/**
 * @type {Integer (Int32)}
 */
export global SHCNEE_MSI_UNINSTALL := 5

/**
 * @type {Integer (UInt32)}
 */
export global NUM_POINTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global CABINETSTATE_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIFNAMESIZE := 30

/**
 * @type {Integer (UInt32)}
 */
export global PIFSTARTLOCSIZE := 63

/**
 * @type {Integer (UInt32)}
 */
export global PIFDEFPATHSIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PIFPARAMSSIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PIFSHPROGSIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PIFSHDATASIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PIFDEFFILESIZE := 80

/**
 * @type {Integer (UInt32)}
 */
export global PIFMAXFILEPATH := 260

/**
 * @type {Integer (UInt32)}
 */
export global QCMINFO_PLACE_BEFORE := 0

/**
 * @type {Integer (UInt32)}
 */
export global QCMINFO_PLACE_AFTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SFVSOC_INVALIDATE_ALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SFVSOC_NOSCROLL := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHELLSTATEVERSION_IE4 := 9

/**
 * @type {Integer (UInt32)}
 */
export global SHELLSTATEVERSION_WIN2K := 10

/**
 * @type {Integer (UInt32)}
 */
export global SHPPFW_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SHPPFW_DIRCREATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHPPFW_ASKDIRCREATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHPPFW_IGNOREFILENAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHPPFW_NOWRITECHECK := 8

/**
 * @type {Integer (UInt32)}
 */
export global SHPPFW_MEDIACHECKONLY := 16

/**
 * @type {Integer (UInt32)}
 */
export global CMF_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMF_DEFAULTONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMF_VERBSONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMF_EXPLORE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMF_NOVERBS := 8

/**
 * @type {Integer (UInt32)}
 */
export global CMF_CANRENAME := 16

/**
 * @type {Integer (UInt32)}
 */
export global CMF_NODEFAULT := 32

/**
 * @type {Integer (UInt32)}
 */
export global CMF_INCLUDESTATIC := 64

/**
 * @type {Integer (UInt32)}
 */
export global CMF_ITEMMENU := 128

/**
 * @type {Integer (UInt32)}
 */
export global CMF_EXTENDEDVERBS := 256

/**
 * @type {Integer (UInt32)}
 */
export global CMF_DISABLEDVERBS := 512

/**
 * @type {Integer (UInt32)}
 */
export global CMF_ASYNCVERBSTATE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CMF_OPTIMIZEFORINVOKE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CMF_SYNCCASCADEMENU := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CMF_DONOTPICKDEFAULT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CMF_RESERVED := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global GCS_VERBA := 0

/**
 * @type {Integer (UInt32)}
 */
export global GCS_HELPTEXTA := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCS_VALIDATEA := 2

/**
 * @type {Integer (UInt32)}
 */
export global GCS_VERBW := 4

/**
 * @type {Integer (UInt32)}
 */
export global GCS_HELPTEXTW := 5

/**
 * @type {Integer (UInt32)}
 */
export global GCS_VALIDATEW := 6

/**
 * @type {Integer (UInt32)}
 */
export global GCS_VERBICONW := 20

/**
 * @type {Integer (UInt32)}
 */
export global GCS_UNICODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global GCS_VERB := 4

/**
 * @type {Integer (UInt32)}
 */
export global GCS_HELPTEXT := 5

/**
 * @type {Integer (UInt32)}
 */
export global GCS_VALIDATE := 6

/**
 * @type {String}
 */
export global CMDSTR_NEWFOLDERA := "NewFolder"

/**
 * @type {String}
 */
export global CMDSTR_VIEWLISTA := "ViewList"

/**
 * @type {String}
 */
export global CMDSTR_VIEWDETAILSA := "ViewDetails"

/**
 * @type {String}
 */
export global CMDSTR_NEWFOLDERW := "NewFolder"

/**
 * @type {String}
 */
export global CMDSTR_VIEWLISTW := "ViewList"

/**
 * @type {String}
 */
export global CMDSTR_VIEWDETAILSW := "ViewDetails"

/**
 * @type {String}
 */
export global CMDSTR_NEWFOLDER := "NewFolder"

/**
 * @type {String}
 */
export global CMDSTR_VIEWLIST := "ViewList"

/**
 * @type {String}
 */
export global CMDSTR_VIEWDETAILS := "ViewDetails"

/**
 * @type {Integer (UInt32)}
 */
export global CMIC_MASK_SHIFT_DOWN := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CMIC_MASK_CONTROL_DOWN := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CMIC_MASK_PTINVOKE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IRTIR_TASK_NOT_RUNNING := 0

/**
 * @type {Integer (UInt32)}
 */
export global IRTIR_TASK_RUNNING := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRTIR_TASK_SUSPENDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRTIR_TASK_PENDING := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRTIR_TASK_FINISHED := 4

/**
 * @type {Integer (UInt32)}
 */
export global ITSAT_DEFAULT_PRIORITY := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global ITSAT_MAX_PRIORITY := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global ITSAT_MIN_PRIORITY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ITSSFLAG_COMPLETE_ON_DESTROY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ITSSFLAG_KILL_ON_DESTROY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ITSSFLAG_FLAGS_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global ITSS_THREAD_TIMEOUT_NO_CHANGE := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global CSIDL_FLAG_PFTI_TRACKTARGET := 16384

/**
 * @type {Integer (Int32)}
 */
export global SHCIDS_ALLFIELDS := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global SHCIDS_CANONICALONLY := 268435456

/**
 * @type {Integer (Int32)}
 */
export global SHCIDS_BITMASK := -65536

/**
 * @type {Integer (Int32)}
 */
export global SHCIDS_COLUMNMASK := 65535

/**
 * @type {String}
 */
export global CONFLICT_RESOLUTION_CLSID_KEY := "ConflictResolutionCLSID"

/**
 * @type {String}
 */
export global STR_BIND_FORCE_FOLDER_SHORTCUT_RESOLVE := "Force Folder Shortcut Resolve"

/**
 * @type {String}
 */
export global STR_AVOID_DRIVE_RESTRICTION_POLICY := "Avoid Drive Restriction Policy"

/**
 * @type {String}
 */
export global STR_SKIP_BINDING_CLSID := "Skip Binding CLSID"

/**
 * @type {String}
 */
export global STR_PARSE_PREFER_FOLDER_BROWSING := "Parse Prefer Folder Browsing"

/**
 * @type {String}
 */
export global STR_DONT_PARSE_RELATIVE := "Don't Parse Relative"

/**
 * @type {String}
 */
export global STR_PARSE_TRANSLATE_ALIASES := "Parse Translate Aliases"

/**
 * @type {String}
 */
export global STR_PARSE_SKIP_NET_CACHE := "Skip Net Resource Cache"

/**
 * @type {String}
 */
export global STR_PARSE_SHELL_PROTOCOL_TO_FILE_OBJECTS := "Parse Shell Protocol To File Objects"

/**
 * @type {String}
 */
export global STR_TRACK_CLSID := "Track the CLSID"

/**
 * @type {String}
 */
export global STR_INTERNAL_NAVIGATE := "Internal Navigation"

/**
 * @type {String}
 */
export global STR_PARSE_PROPERTYSTORE := "DelegateNamedProperties"

/**
 * @type {String}
 */
export global STR_NO_VALIDATE_FILENAME_CHARS := "NoValidateFilenameChars"

/**
 * @type {String}
 */
export global STR_BIND_DELEGATE_CREATE_OBJECT := "Delegate Object Creation"

/**
 * @type {String}
 */
export global STR_PARSE_ALLOW_INTERNET_SHELL_FOLDERS := "Allow binding to Internet shell folder handlers and negate STR_PARSE_PREFER_WEB_BROWSING"

/**
 * @type {String}
 */
export global STR_PARSE_PREFER_WEB_BROWSING := "Do not bind to Internet shell folder handlers"

/**
 * @type {String}
 */
export global STR_PARSE_SHOW_NET_DIAGNOSTICS_UI := "Show network diagnostics UI"

/**
 * @type {String}
 */
export global STR_PARSE_DONT_REQUIRE_VALIDATED_URLS := "Do not require validated URLs"

/**
 * @type {String}
 */
export global STR_INTERNETFOLDER_PARSE_ONLY_URLMON_BINDABLE := "Validate URL"

/**
 * @type {Integer (UInt32)}
 */
export global BIND_INTERRUPTABLE := 4294967295

/**
 * @type {String}
 */
export global STR_BIND_FOLDERS_READ_ONLY := "Folders As Read Only"

/**
 * @type {String}
 */
export global STR_BIND_FOLDER_ENUM_MODE := "Folder Enum Mode"

/**
 * @type {String}
 */
export global STR_PARSE_WITH_EXPLICIT_PROGID := "ExplicitProgid"

/**
 * @type {String}
 */
export global STR_PARSE_WITH_EXPLICIT_ASSOCAPP := "ExplicitAssociationApp"

/**
 * @type {String}
 */
export global STR_PARSE_EXPLICIT_ASSOCIATION_SUCCESSFUL := "ExplicitAssociationSuccessful"

/**
 * @type {String}
 */
export global STR_PARSE_AND_CREATE_ITEM := "ParseAndCreateItem"

/**
 * @type {String}
 */
export global STR_PROPERTYBAG_PARAM := "SHBindCtxPropertyBag"

/**
 * @type {String}
 */
export global STR_ENUM_ITEMS_FLAGS := "SHCONTF"

/**
 * @type {String}
 */
export global STR_STORAGEITEM_CREATION_FLAGS := "SHGETSTORAGEITEM"

/**
 * @type {String}
 */
export global STR_ITEM_CACHE_CONTEXT := "ItemCacheContext"

/**
 * @type {Integer (UInt32)}
 */
export global CDBOSC_SETFOCUS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CDBOSC_KILLFOCUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CDBOSC_SELCHANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CDBOSC_RENAME := 3

/**
 * @type {Integer (UInt32)}
 */
export global CDBOSC_STATECHANGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CDB2N_CONTEXTMENU_DONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CDB2N_CONTEXTMENU_START := 2

/**
 * @type {Integer (UInt32)}
 */
export global CDB2GVF_SHOWALLFILES := 1

/**
 * @type {Integer (UInt32)}
 */
export global CDB2GVF_ISFILESAVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CDB2GVF_ALLOWPREVIEWPANE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CDB2GVF_NOSELECTVERB := 8

/**
 * @type {Integer (UInt32)}
 */
export global CDB2GVF_NOINCLUDEITEM := 16

/**
 * @type {Integer (UInt32)}
 */
export global CDB2GVF_ISFOLDERPICKER := 32

/**
 * @type {Integer (UInt32)}
 */
export global CDB2GVF_ADDSHIELD := 64

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_DEFBROWSER := 0

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_SAMEBROWSER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_NEWBROWSER := 2

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_DEFMODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_OPENMODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_EXPLOREMODE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_HELPMODE := 64

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_NOTRANSFERHIST := 128

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_ABSOLUTE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_RELATIVE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_PARENT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_NAVIGATEBACK := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_NAVIGATEFORWARD := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_ALLOW_AUTONAVIGATE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_KEEPSAMETEMPLATE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_KEEPWORDWHEELTEXT := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_ACTIVATE_NOFOCUS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_CREATENOHISTORY := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_PLAYNOSOUND := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_CALLERUNTRUSTED := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_TRUSTFIRSTDOWNLOAD := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_UNTRUSTEDFORDOWNLOAD := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_NOAUTOSELECT := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_WRITENOHISTORY := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_TRUSTEDFORACTIVEX := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_FEEDNAVIGATION := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_REDIRECT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SBSP_INITIATEDBYHLINKFRAME := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global FCW_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FCW_TOOLBAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global FCW_TREE := 3

/**
 * @type {Integer (UInt32)}
 */
export global FCW_INTERNETBAR := 6

/**
 * @type {Integer (UInt32)}
 */
export global FCW_PROGRESS := 8

/**
 * @type {Integer (UInt32)}
 */
export global FCT_MERGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FCT_CONFIGABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FCT_ADDTOEND := 4

/**
 * @type {String}
 */
export global STR_DONT_RESOLVE_LINK := "Don't Resolve Link"

/**
 * @type {String}
 */
export global STR_GET_ASYNC_HANDLER := "GetAsyncHandler"

/**
 * @type {String}
 */
export global STR_GPS_HANDLERPROPERTIESONLY := "GPS_HANDLERPROPERTIESONLY"

/**
 * @type {String}
 */
export global STR_GPS_FASTPROPERTIESONLY := "GPS_FASTPROPERTIESONLY"

/**
 * @type {String}
 */
export global STR_GPS_OPENSLOWITEM := "GPS_OPENSLOWITEM"

/**
 * @type {String}
 */
export global STR_GPS_DELAYCREATION := "GPS_DELAYCREATION"

/**
 * @type {String}
 */
export global STR_GPS_BESTEFFORT := "GPS_BESTEFFORT"

/**
 * @type {String}
 */
export global STR_GPS_NO_OPLOCK := "GPS_NO_OPLOCK"

/**
 * @type {String}
 */
export global DI_GETDRAGIMAGE := "ShellGetDragImage"

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_AUTORUNINF := 2

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_AUDIOCD := 4

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_DVDMOVIE := 8

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_BLANKCD := 16

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_BLANKDVD := 32

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_UNKNOWNCONTENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_AUTOPLAYPIX := 128

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_AUTOPLAYMUSIC := 256

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_AUTOPLAYVIDEO := 512

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_VCD := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_SVCD := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_DVDAUDIO := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_BLANKBD := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_BLURAY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_CAMERASTORAGE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_CUSTOMEVENT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_MASK := 131070

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_PHASE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_PHASE_PRESNIFF := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_PHASE_SNIFFING := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_PHASE_FINAL := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global ARCONTENT_PHASE_MASK := 1879048192

/**
 * @type {Integer (UInt32)}
 */
export global IEI_PRIORITY_MAX := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global IEI_PRIORITY_MIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global IEIT_PRIORITY_NORMAL := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_ASYNC := 1

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_CACHE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_ASPECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_OFFLINE := 8

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_GLEAM := 16

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_SCREEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_ORIGSIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_NOSTAMP := 128

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_NOBORDER := 256

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_QUALITY := 512

/**
 * @type {Integer (UInt32)}
 */
export global IEIFLAG_REFRESH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DBIM_MINSIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBIM_MAXSIZE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBIM_INTEGRAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBIM_ACTUAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global DBIM_TITLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DBIM_MODEFLAGS := 32

/**
 * @type {Integer (UInt32)}
 */
export global DBIM_BKCOLOR := 64

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_FIXED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_FIXEDBMP := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_VARIABLEHEIGHT := 8

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_UNDELETEABLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_DEBOSSED := 32

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_BKCOLOR := 64

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_USECHEVRON := 128

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_BREAK := 256

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_ADDTOFRONT := 512

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_TOPALIGN := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_NOGRIPPER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_ALWAYSGRIPPER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DBIMF_NOMARGINS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DBIF_VIEWMODE_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DBIF_VIEWMODE_VERTICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBIF_VIEWMODE_FLOATING := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBIF_VIEWMODE_TRANSPARENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBPC_SELECTFIRST := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global THBN_CLICKED := 6144

/**
 * @type {Integer (UInt32)}
 */
export global BSIM_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BSIM_STYLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BSSF_VISIBLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BSSF_NOTITLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BSSF_UNDELETEABLE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_AUTOGRIPPER := 0

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_NOGRIPPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_ALWAYSGRIPPER := 2

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_LEFTALIGN := 4

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_SINGLECLICK := 8

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_NOCONTEXTMENU := 16

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_NODROPTARGET := 32

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_NOCAPTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_PREFERNOLINEBREAK := 128

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_LOCKED := 256

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_PRESERVEORDERDURINGLAYOUT := 512

/**
 * @type {Integer (UInt32)}
 */
export global BSIS_FIXEDORDER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global OF_CAP_CANSWITCHTO := 1

/**
 * @type {Integer (UInt32)}
 */
export global OF_CAP_CANCLOSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SMDM_SHELLFOLDER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SMDM_HMENU := 2

/**
 * @type {Integer (UInt32)}
 */
export global SMDM_TOOLBAR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SMC_INITMENU := 1

/**
 * @type {Integer (UInt32)}
 */
export global SMC_CREATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SMC_EXITMENU := 3

/**
 * @type {Integer (UInt32)}
 */
export global SMC_GETINFO := 5

/**
 * @type {Integer (UInt32)}
 */
export global SMC_GETSFINFO := 6

/**
 * @type {Integer (UInt32)}
 */
export global SMC_GETOBJECT := 7

/**
 * @type {Integer (UInt32)}
 */
export global SMC_GETSFOBJECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global SMC_SFEXEC := 9

/**
 * @type {Integer (UInt32)}
 */
export global SMC_SFSELECTITEM := 10

/**
 * @type {Integer (UInt32)}
 */
export global SMC_REFRESH := 16

/**
 * @type {Integer (UInt32)}
 */
export global SMC_DEMOTE := 17

/**
 * @type {Integer (UInt32)}
 */
export global SMC_PROMOTE := 18

/**
 * @type {Integer (UInt32)}
 */
export global SMC_DEFAULTICON := 22

/**
 * @type {Integer (UInt32)}
 */
export global SMC_NEWITEM := 23

/**
 * @type {Integer (UInt32)}
 */
export global SMC_CHEVRONEXPAND := 25

/**
 * @type {Integer (UInt32)}
 */
export global SMC_DISPLAYCHEVRONTIP := 42

/**
 * @type {Integer (UInt32)}
 */
export global SMC_SETSFOBJECT := 45

/**
 * @type {Integer (UInt32)}
 */
export global SMC_SHCHANGENOTIFY := 46

/**
 * @type {Integer (UInt32)}
 */
export global SMC_CHEVRONGETTIP := 47

/**
 * @type {Integer (UInt32)}
 */
export global SMC_SFDDRESTRICTED := 48

/**
 * @type {Integer (UInt32)}
 */
export global SMC_SFEXEC_MIDDLE := 49

/**
 * @type {Integer (UInt32)}
 */
export global SMC_GETAUTOEXPANDSTATE := 65

/**
 * @type {Integer (UInt32)}
 */
export global SMC_AUTOEXPANDCHANGE := 66

/**
 * @type {Integer (UInt32)}
 */
export global SMC_GETCONTEXTMENUMODIFIER := 67

/**
 * @type {Integer (UInt32)}
 */
export global SMC_GETBKCONTEXTMENU := 68

/**
 * @type {Integer (UInt32)}
 */
export global SMC_OPEN := 69

/**
 * @type {Integer (UInt32)}
 */
export global SMAE_EXPANDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SMAE_CONTRACTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SMAE_USER := 4

/**
 * @type {Integer (UInt32)}
 */
export global SMAE_VALID := 7

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_RESTRICT_DRAGDROP := 2

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_TOPLEVEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_CACHED := 16

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_AUTOEXPAND := 256

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_AUTOTOOLTIP := 512

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_DROPONCONTAINER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_VERTICAL := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SMINIT_HORIZONTAL := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SMSET_TOP := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SMSET_BOTTOM := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SMSET_DONTOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SMINV_REFRESH := 1

/**
 * @type {Integer (UInt32)}
 */
export global SMINV_ID := 8

/**
 * @type {Integer (Int32)}
 */
export global E_PREVIEWHANDLER_DRM_FAIL := -2042494975

/**
 * @type {Integer (Int32)}
 */
export global E_PREVIEWHANDLER_NOAUTH := -2042494974

/**
 * @type {Integer (Int32)}
 */
export global E_PREVIEWHANDLER_NOTFOUND := -2042494973

/**
 * @type {Integer (Int32)}
 */
export global E_PREVIEWHANDLER_CORRUPT := -2042494972

/**
 * @type {String}
 */
export global STR_FILE_SYS_BIND_DATA := "File System Bind Data"

/**
 * @type {String}
 */
export global STR_FILE_SYS_BIND_DATA_WIN7_FORMAT := "Win7FileSystemIdList"

/**
 * @type {String}
 */
export global HOMEGROUP_SECURITY_GROUP_MULTI := "HUG"

/**
 * @type {String}
 */
export global HOMEGROUP_SECURITY_GROUP := "HomeUsers"

/**
 * @type {String}
 */
export global PROP_CONTRACT_DELEGATE := "ContractDelegate"

/**
 * @type {Guid}
 */
export global SID_URLExecutionContext := Guid("{fb5f8ebc-bbb6-4d10-a461-777291a09030}")

/**
 * @type {String}
 */
export global STR_TAB_REUSE_IDENTIFIER := "Tab Reuse Identifier"

/**
 * @type {String}
 */
export global STR_REFERRER_IDENTIFIER := "Referrer Identifier"

/**
 * @type {Guid}
 */
export global SID_LaunchSourceViewSizePreference := Guid("{80605492-67d9-414f-af89-a1cdf1242bc1}")

/**
 * @type {Guid}
 */
export global SID_LaunchTargetViewSizePreference := Guid("{26db2472-b7b7-406b-9702-730a4e20d3bf}")

/**
 * @type {Guid}
 */
export global SID_LaunchSourceAppUserModelId := Guid("{2ce78010-74db-48bc-9c6a-10f372495723}")

/**
 * @type {Guid}
 */
export global SID_ShellExecuteNamedPropertyStore := Guid("{eb84ada2-00ff-4992-8324-ed5ce061cb29}")

/**
 * @type {Integer (UInt32)}
 */
export global ISIOI_ICONFILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISIOI_ICONINDEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global ABM_NEW := 0

/**
 * @type {Integer (UInt32)}
 */
export global ABM_REMOVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ABM_QUERYPOS := 2

/**
 * @type {Integer (UInt32)}
 */
export global ABM_SETPOS := 3

/**
 * @type {Integer (UInt32)}
 */
export global ABM_GETSTATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ABM_GETTASKBARPOS := 5

/**
 * @type {Integer (UInt32)}
 */
export global ABM_ACTIVATE := 6

/**
 * @type {Integer (UInt32)}
 */
export global ABM_GETAUTOHIDEBAR := 7

/**
 * @type {Integer (UInt32)}
 */
export global ABM_SETAUTOHIDEBAR := 8

/**
 * @type {Integer (UInt32)}
 */
export global ABM_WINDOWPOSCHANGED := 9

/**
 * @type {Integer (UInt32)}
 */
export global ABM_SETSTATE := 10

/**
 * @type {Integer (UInt32)}
 */
export global ABM_GETAUTOHIDEBAREX := 11

/**
 * @type {Integer (UInt32)}
 */
export global ABM_SETAUTOHIDEBAREX := 12

/**
 * @type {Integer (UInt32)}
 */
export global ABN_STATECHANGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ABN_POSCHANGED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ABN_FULLSCREENAPP := 2

/**
 * @type {Integer (UInt32)}
 */
export global ABN_WINDOWARRANGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global ABS_AUTOHIDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ABS_ALWAYSONTOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global ABE_LEFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ABE_TOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global ABE_RIGHT := 2

/**
 * @type {Integer (UInt32)}
 */
export global ABE_BOTTOM := 3

/**
 * @type {Integer (UInt32)}
 */
export global FO_MOVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FO_COPY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FO_DELETE := 3

/**
 * @type {Integer (UInt32)}
 */
export global FO_RENAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global PO_DELETE := 19

/**
 * @type {Integer (UInt32)}
 */
export global PO_RENAME := 20

/**
 * @type {Integer (UInt32)}
 */
export global PO_PORTCHANGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global PO_REN_PORT := 52

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_FNF := 2

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_PNF := 3

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_ACCESSDENIED := 5

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_OOM := 8

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_DLLNOTFOUND := 32

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_SHARE := 26

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_ASSOCINCOMPLETE := 27

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_DDETIMEOUT := 28

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_DDEFAIL := 29

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_DDEBUSY := 30

/**
 * @type {Integer (UInt32)}
 */
export global SE_ERR_NOASSOC := 31

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_CLASSNAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_CLASSKEY := 3

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_IDLIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_INVOKEIDLIST := 12

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_ICON := 16

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_HOTKEY := 32

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_NOCLOSEPROCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_CONNECTNETDRV := 128

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_NOASYNC := 256

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_FLAG_DDEWAIT := 256

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_DOENVSUBST := 512

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_FLAG_NO_UI := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_UNICODE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_NO_CONSOLE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_ASYNCOK := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_HMONITOR := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_NOZONECHECKS := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_NOQUERYCLASSSTORE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_WAITFORINPUTIDLE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_FLAG_LOG_USAGE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SEE_MASK_FLAG_HINST_IS_SITE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global SHERB_NOCONFIRMATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHERB_NOPROGRESSUI := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHERB_NOSOUND := 4

/**
 * @type {Integer (UInt32)}
 */
export global NIN_SELECT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global NINF_KEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global NIN_BALLOONSHOW := 1026

/**
 * @type {Integer (UInt32)}
 */
export global NIN_BALLOONHIDE := 1027

/**
 * @type {Integer (UInt32)}
 */
export global NIN_BALLOONTIMEOUT := 1028

/**
 * @type {Integer (UInt32)}
 */
export global NIN_BALLOONUSERCLICK := 1029

/**
 * @type {Integer (UInt32)}
 */
export global NIN_POPUPOPEN := 1030

/**
 * @type {Integer (UInt32)}
 */
export global NIN_POPUPCLOSE := 1031

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFYICON_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFYICON_VERSION_4 := 4

/**
 * @type {Integer (UInt64)}
 */
export global SHGNLI_PIDL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SHGNLI_PREFIXNAME := 2

/**
 * @type {Integer (UInt64)}
 */
export global SHGNLI_NOUNIQUE := 4

/**
 * @type {Integer (UInt64)}
 */
export global SHGNLI_NOLNK := 8

/**
 * @type {Integer (UInt64)}
 */
export global SHGNLI_NOLOCNAME := 16

/**
 * @type {Integer (UInt64)}
 */
export global SHGNLI_USEURLEXT := 32

/**
 * @type {Integer (UInt32)}
 */
export global PRINTACTION_OPEN := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRINTACTION_PROPERTIES := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRINTACTION_NETINSTALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRINTACTION_NETINSTALLLINK := 3

/**
 * @type {Integer (UInt32)}
 */
export global PRINTACTION_TESTPAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRINTACTION_OPENNETPRN := 5

/**
 * @type {Integer (UInt32)}
 */
export global PRINTACTION_DOCUMENTDEFAULTS := 6

/**
 * @type {Integer (UInt32)}
 */
export global PRINTACTION_SERVERPROPERTIES := 7

/**
 * @type {Integer (UInt32)}
 */
export global PRINT_PROP_FORCE_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINE_STATUS_LOCAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINE_STATUS_REMOTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINE_STATUS_INCOMPLETE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHIL_LARGE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SHIL_SMALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHIL_EXTRALARGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHIL_SYSSMALL := 3

/**
 * @type {Integer (UInt32)}
 */
export global SHIL_JUMBO := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHIL_LAST := 4

/**
 * @type {String}
 */
export global WC_NETADDRESS := "msctls_netaddress"

/**
 * @type {Integer (UInt32)}
 */
export global NCM_GETADDRESS := 1025

/**
 * @type {Integer (UInt32)}
 */
export global NCM_SETALLOWTYPE := 1026

/**
 * @type {Integer (UInt32)}
 */
export global NCM_GETALLOWTYPE := 1027

/**
 * @type {Integer (UInt32)}
 */
export global NCM_DISPLAYERRORTIP := 1028

/**
 * @type {Integer (UInt32)}
 */
export global CREDENTIAL_PROVIDER_NO_DEFAULT := 4294967295

/**
 * @type {Guid}
 */
export global Identity_LocalUserProvider := Guid("{a198529b-730f-4089-b646-a12557f5665e}")

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SYNCMGR_ID := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SYNCMGR_PROGRESSTEXT := 260

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SYNCMGR_NAME := 128

/**
 * @type {Integer (Int32)}
 */
export global STIF_DEFAULT := 0

/**
 * @type {Integer (Int32)}
 */
export global STIF_SUPPORT_HEX := 1

/**
 * @type {String}
 */
export global SZ_CONTENTTYPE_HTMLA := "text/html"

/**
 * @type {String}
 */
export global SZ_CONTENTTYPE_HTMLW := "text/html"

/**
 * @type {String}
 */
export global SZ_CONTENTTYPE_CDFA := "application/x-cdf"

/**
 * @type {String}
 */
export global SZ_CONTENTTYPE_CDFW := "application/x-cdf"

/**
 * @type {String}
 */
export global SZ_CONTENTTYPE_HTML := "text/html"

/**
 * @type {String}
 */
export global SZ_CONTENTTYPE_CDF := "application/x-cdf"

/**
 * @type {Integer (UInt32)}
 */
export global GCT_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global GCT_LFNCHAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCT_SHORTCHAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global GCT_WILD := 4

/**
 * @type {Integer (UInt32)}
 */
export global GCT_SEPARATOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global PMSF_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PMSF_MULTIPLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PMSF_DONT_STRIP_SPACES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global URL_UNESCAPE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global URL_ESCAPE_UNSAFE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global URL_PLUGGABLE_PROTOCOL := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global URL_WININET_COMPATIBILITY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global URL_DONT_ESCAPE_EXTRA_INFO := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global URL_DONT_UNESCAPE_EXTRA_INFO := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global URL_BROWSER_MODE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global URL_ESCAPE_SPACES_ONLY := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global URL_DONT_SIMPLIFY := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global URL_NO_META := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global URL_UNESCAPE_INPLACE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global URL_CONVERT_IF_DOSPATH := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global URL_UNESCAPE_HIGH_ANSI_ONLY := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global URL_INTERNAL_PATH := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global URL_FILE_USE_PATHURL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global URL_DONT_UNESCAPE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global URL_ESCAPE_AS_UTF8 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global URL_UNESCAPE_AS_UTF8 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global URL_ESCAPE_ASCII_URI_COMPONENT := 524288

/**
 * @type {Integer (UInt32)}
 */
export global URL_UNESCAPE_URI_COMPONENT := 262144

/**
 * @type {Integer (UInt32)}
 */
export global URL_ESCAPE_PERCENT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global URL_ESCAPE_SEGMENT_ONLY := 8192

/**
 * @type {Integer (UInt32)}
 */
export global URL_PARTFLAG_KEEPSCHEME := 1

/**
 * @type {Integer (UInt32)}
 */
export global URL_APPLY_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global URL_APPLY_GUESSSCHEME := 2

/**
 * @type {Integer (UInt32)}
 */
export global URL_APPLY_GUESSFILE := 4

/**
 * @type {Integer (UInt32)}
 */
export global URL_APPLY_FORCEAPPLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RT_REG_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RT_REG_SZ := 2

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RT_REG_EXPAND_SZ := 4

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RT_REG_BINARY := 8

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RT_REG_DWORD := 16

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RT_REG_MULTI_SZ := 32

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RT_REG_QWORD := 64

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RT_ANY := 65535

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RM_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RM_NORMAL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RM_SAFE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_RM_SAFENETWORK := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_NOEXPAND := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_ZEROONFAILURE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SRRF_NOVIRT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SHREGSET_HKCU := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHREGSET_FORCE_HKCU := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHREGSET_HKLM := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHREGSET_FORCE_HKLM := 8

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_SHELL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_DEBUGOUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_TEST := 4

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_BROWSER := 8

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_FLUSH := 16

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_EVENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_MSVM := 64

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_FORMATTEXT := 128

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_PROFILE := 256

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_DEBUGBREAK := 512

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_MSGTRACE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_PERFTAGS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_MEMWATCH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_DBMON := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_MULTISTOP := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SPMODE_EVENTTRACE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SHGVSPB_PERUSER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHGVSPB_ALLUSERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHGVSPB_PERFOLDER := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHGVSPB_ALLFOLDERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SHGVSPB_INHERIT := 16

/**
 * @type {Integer (UInt32)}
 */
export global SHGVSPB_ROAM := 32

/**
 * @type {Integer (UInt32)}
 */
export global SHGVSPB_NOAUTODEFAULTS := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global FDTF_SHORTTIME := 1

/**
 * @type {Integer (UInt32)}
 */
export global FDTF_SHORTDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FDTF_LONGDATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FDTF_LONGTIME := 8

/**
 * @type {Integer (UInt32)}
 */
export global FDTF_RELATIVE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FDTF_LTRDATE := 256

/**
 * @type {Integer (UInt32)}
 */
export global FDTF_RTLDATE := 512

/**
 * @type {Integer (UInt32)}
 */
export global FDTF_NOAUTOREADINGORDER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PLATFORM_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global PLATFORM_IE3 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PLATFORM_BROWSERONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PLATFORM_INTEGRATED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ILMM_IE4 := 0

/**
 * @type {Integer (UInt32)}
 */
export global DLLVER_PLATFORM_WINDOWS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DLLVER_PLATFORM_NT := 2

/**
 * @type {Integer (UInt64)}
 */
export global DLLVER_MAJOR_MASK := 18446462598732840960

/**
 * @type {Integer (UInt64)}
 */
export global DLLVER_MINOR_MASK := 281470681743360

/**
 * @type {Integer (UInt64)}
 */
export global DLLVER_BUILD_MASK := 4294901760

/**
 * @type {Integer (UInt64)}
 */
export global DLLVER_QFE_MASK := 65535

/**
 * @type {Integer (Int32)}
 */
export global WTS_E_FAILEDEXTRACTION := -2147175936

/**
 * @type {Integer (Int32)}
 */
export global WTS_E_EXTRACTIONTIMEDOUT := -2147175935

/**
 * @type {Integer (Int32)}
 */
export global WTS_E_SURROGATEUNAVAILABLE := -2147175934

/**
 * @type {Integer (Int32)}
 */
export global WTS_E_FASTEXTRACTIONNOTSUPPORTED := -2147175933

/**
 * @type {Integer (Int32)}
 */
export global WTS_E_DATAFILEUNAVAILABLE := -2147175932

/**
 * @type {Integer (Int32)}
 */
export global WTS_E_EXTRACTIONPENDING := -2147175931

/**
 * @type {Integer (Int32)}
 */
export global WTS_E_EXTRACTIONBLOCKED := -2147175930

/**
 * @type {Integer (Int32)}
 */
export global WTS_E_NOSTORAGEPROVIDERTHUMBNAILHANDLER := -2147175929

/**
 * @type {String}
 */
export global SHIMGKEY_QUALITY := "Compression"

/**
 * @type {String}
 */
export global SHIMGKEY_RAWFORMAT := "RawDataFormat"

/**
 * @type {Integer (UInt32)}
 */
export global SHIMGDEC_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SHIMGDEC_THUMBNAIL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHIMGDEC_LOADFULL := 2

/**
 * @type {Integer (Int32)}
 */
export global E_NOTVALIDFORANIMATEDIMAGE := -2147221503

/**
 * @type {Integer (Int32)}
 */
export global S_SYNCMGR_MISSINGITEMS := 262657

/**
 * @type {Integer (Int32)}
 */
export global S_SYNCMGR_RETRYSYNC := 262658

/**
 * @type {Integer (Int32)}
 */
export global S_SYNCMGR_CANCELITEM := 262659

/**
 * @type {Integer (Int32)}
 */
export global S_SYNCMGR_CANCELALL := 262660

/**
 * @type {Integer (Int32)}
 */
export global S_SYNCMGR_ITEMDELETED := 262672

/**
 * @type {Integer (Int32)}
 */
export global S_SYNCMGR_ENUMITEMS := 262673

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRPROGRESSITEM_STATUSTEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRPROGRESSITEM_STATUSTYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRPROGRESSITEM_PROGVALUE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRPROGRESSITEM_MAXVALUE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRLOGERROR_ERRORFLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRLOGERROR_ERRORID := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRLOGERROR_ITEMID := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRITEM_ITEMFLAGMASK := 127

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SYNCMGRITEMNAME := 128

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRHANDLERFLAG_MASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SYNCMGRHANDLERNAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global SYNCMGRREGISTERFLAGS_MASK := 7

/**
 * @type {Integer (Int32)}
 */
export global TLOG_BACK := -1

/**
 * @type {Integer (UInt32)}
 */
export global TLOG_CURRENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TLOG_FORE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TLMENUF_INCLUDECURRENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TLMENUF_BACK := 16

/**
 * @type {Integer (UInt32)}
 */
export global TLMENUF_FORE := 32

/**
 * @type {Integer (UInt32)}
 */
export global BSF_REGISTERASDROPTARGET := 1

/**
 * @type {Integer (UInt32)}
 */
export global BSF_THEATERMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BSF_NOLOCALFILEWARNING := 16

/**
 * @type {Integer (UInt32)}
 */
export global BSF_UISETBYAUTOMATION := 256

/**
 * @type {Integer (UInt32)}
 */
export global BSF_RESIZABLE := 512

/**
 * @type {Integer (UInt32)}
 */
export global BSF_CANMAXIMIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global BSF_TOPBROWSER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global BSF_NAVNOHISTORY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global BSF_HTMLNAVCANCELED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global BSF_DONTSHOWNAVCANCELPAGE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global BSF_SETNAVIGATABLECODEPAGE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global BSF_DELEGATEDNAVIGATION := 65536

/**
 * @type {Integer (UInt32)}
 */
export global BSF_TRUSTEDFORACTIVEX := 131072

/**
 * @type {Integer (UInt32)}
 */
export global BSF_MERGEDMENUS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global BSF_FEEDNAVIGATION := 524288

/**
 * @type {Integer (UInt32)}
 */
export global BSF_FEEDSUBSCRIBED := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global HLNF_CALLERUNTRUSTED := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global HLNF_TRUSTEDFORACTIVEX := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global HLNF_DISABLEWINDOWRESTRICTIONS := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global HLNF_TRUSTFIRSTDOWNLOAD := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global HLNF_UNTRUSTEDFORDOWNLOAD := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SHHLNF_NOAUTOSELECT := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SHHLNF_WRITENOHISTORY := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global HLNF_EXTERNALNAVIGATE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global HLNF_ALLOW_AUTONAVIGATE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global HLNF_NEWWINDOWSMANAGED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_MAX_PATH_LENGTH := 2048

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_MAX_SCHEME_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_RESTRICTED := 112

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_CACHEHIT := 80

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_STALECACHEHIT := 69

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_USEASDEFAULT := 67

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_SHELLEXT := 64

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_CACHEMISS := 48

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_INHERIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_SHELLEXT_ASBACKUP := 21

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_DESPERATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global VIEW_PRIORITY_NONE := 0

/**
 * @type {String}
 */
export global VOLUME_PREFIX := "\\?\Volume"

/**
 * @type {Integer (UInt32)}
 */
export global PATHCCH_MAX_CCH := 32768

/**
 * @type {Integer (UInt32)}
 */
export global IDS_DESCRIPTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global ID_APP := 100

/**
 * @type {Integer (UInt32)}
 */
export global DLG_SCRNSAVECONFIGURE := 2003

/**
 * @type {Integer (UInt32)}
 */
export global idsIsPassword := 1000

/**
 * @type {Integer (UInt32)}
 */
export global idsIniFile := 1001

/**
 * @type {Integer (UInt32)}
 */
export global idsScreenSaver := 1002

/**
 * @type {Integer (UInt32)}
 */
export global idsPassword := 1003

/**
 * @type {Integer (UInt32)}
 */
export global idsDifferentPW := 1004

/**
 * @type {Integer (UInt32)}
 */
export global idsChangePW := 1005

/**
 * @type {Integer (UInt32)}
 */
export global idsBadOldPW := 1006

/**
 * @type {Integer (UInt32)}
 */
export global idsAppName := 1007

/**
 * @type {Integer (UInt32)}
 */
export global idsNoHelpMemory := 1008

/**
 * @type {Integer (UInt32)}
 */
export global idsHelpFile := 1009

/**
 * @type {Integer (UInt32)}
 */
export global idsDefKeyword := 1010

/**
 * @type {Integer (UInt32)}
 */
export global MAXFILELEN := 13

/**
 * @type {Integer (UInt32)}
 */
export global TITLEBARNAMELEN := 40

/**
 * @type {Integer (UInt32)}
 */
export global APPNAMEBUFFERLEN := 40

/**
 * @type {Integer (UInt32)}
 */
export global BUFFLEN := 255

/**
 * @type {Integer (UInt32)}
 */
export global SCRM_VERIFYPW := 32768

/**
 * @type {Integer (Int32)}
 */
export global E_FLAGS := -2147217408

/**
 * @type {Integer (Int32)}
 */
export global IS_E_EXEC_FAILED := -2147213310

/**
 * @type {Integer (Int32)}
 */
export global URL_E_INVALID_SYNTAX := -2147217407

/**
 * @type {Integer (Int32)}
 */
export global URL_E_UNREGISTERED_PROTOCOL := -2147217406

/**
 * @type {Integer (UInt32)}
 */
export global CPLPAGE_MOUSE_BUTTONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPLPAGE_MOUSE_PTRMOTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPLPAGE_MOUSE_WHEEL := 3

/**
 * @type {Integer (UInt32)}
 */
export global CPLPAGE_KEYBOARD_SPEED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPLPAGE_DISPLAY_BACKGROUND := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SELECTIONCHANGED := 200

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FILELISTENUMDONE := 201

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_VERBINVOKED := 202

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_DEFAULTVERBINVOKED := 203

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_BEGINDRAG := 204

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_VIEWMODECHANGED := 205

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_NOITEMSTATE_CHANGED := 206

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CONTENTSCHANGED := 207

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FOCUSCHANGED := 208

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CHECKSTATECHANGED := 209

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ORDERCHANGED := 210

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_VIEWPAINTDONE := 211

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_COLUMNSCHANGED := 212

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_CTRLMOUSEWHEEL := 213

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SORTDONE := 214

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ICONSIZECHANGED := 215

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FOLDERCHANGED := 217

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_FILTERINVOKED := 218

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_WORDWHEELEDITED := 219

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SELECTEDITEMCHANGED := 220

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_EXPLORERWINDOWREADY := 221

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_UPDATEIMAGE := 222

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_INITIALENUMERATIONDONE := 223

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ENTERPRISEIDCHANGED := 224

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_ENTERPRESSED := 200

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SEARCHCOMMAND_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SEARCHCOMMAND_COMPLETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SEARCHCOMMAND_ABORT := 3

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SEARCHCOMMAND_UPDATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SEARCHCOMMAND_PROGRESSTEXT := 5

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SEARCHCOMMAND_ERROR := 6

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_SEARCHCOMMAND_RESTORE := 7

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IADCCTL_DIRTY := 256

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IADCCTL_PUBCAT := 257

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IADCCTL_SORT := 258

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IADCCTL_FORCEX86 := 259

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IADCCTL_SHOWPOSTSETUP := 260

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IADCCTL_ONDOMAIN := 261

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_IADCCTL_DEFAULTCAT := 262

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_YES := 2555905

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_NOT_HANDLED := 2555907

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_USER_RETRY := 2555908

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_USER_IGNORED := 2555909

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_MERGE := 2555910

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_DONT_PROCESS_CHILDREN := 2555912

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_ALREADY_DONE := 2555914

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_PENDING := 2555915

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_KEEP_BOTH := 2555916

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_CLOSE_PROGRAM := 2555917

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_COLLISIONRESOLVED := 2555918

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_PROGRESS_PAUSE := 2555919

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_PENDING_DELETE := 2555920

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_S_PENDING_BATCH_COPY := 2555921

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_USER_CANCELLED := -2144927744

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_CANCELLED := -2144927743

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_REQUIRES_ELEVATION := -2144927742

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SAME_FILE := -2144927741

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DIFF_DIR := -2144927740

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_MANY_SRC_1_DEST := -2144927739

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DEST_SUBTREE := -2144927735

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DEST_SAME_TREE := -2144927734

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_FLD_IS_FILE_DEST := -2144927733

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_FILE_IS_FLD_DEST := -2144927732

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_FILE_TOO_LARGE := -2144927731

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_REMOVABLE_FULL := -2144927730

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DEST_IS_RO_CD := -2144927729

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DEST_IS_RW_CD := -2144927728

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DEST_IS_R_CD := -2144927727

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DEST_IS_RO_DVD := -2144927726

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DEST_IS_RW_DVD := -2144927725

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DEST_IS_R_DVD := -2144927724

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SRC_IS_RO_CD := -2144927723

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SRC_IS_RW_CD := -2144927722

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SRC_IS_R_CD := -2144927721

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SRC_IS_RO_DVD := -2144927720

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SRC_IS_RW_DVD := -2144927719

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SRC_IS_R_DVD := -2144927718

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_INVALID_FILES_SRC := -2144927717

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_INVALID_FILES_DEST := -2144927716

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_PATH_TOO_DEEP_SRC := -2144927715

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_PATH_TOO_DEEP_DEST := -2144927714

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ROOT_DIR_SRC := -2144927713

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ROOT_DIR_DEST := -2144927712

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ACCESS_DENIED_SRC := -2144927711

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ACCESS_DENIED_DEST := -2144927710

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_PATH_NOT_FOUND_SRC := -2144927709

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_PATH_NOT_FOUND_DEST := -2144927708

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_NET_DISCONNECT_SRC := -2144927707

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_NET_DISCONNECT_DEST := -2144927706

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SHARING_VIOLATION_SRC := -2144927705

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SHARING_VIOLATION_DEST := -2144927704

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ALREADY_EXISTS_NORMAL := -2144927703

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ALREADY_EXISTS_READONLY := -2144927702

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ALREADY_EXISTS_SYSTEM := -2144927701

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ALREADY_EXISTS_FOLDER := -2144927700

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_STREAM_LOSS := -2144927699

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_EA_LOSS := -2144927698

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_PROPERTY_LOSS := -2144927697

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_PROPERTIES_LOSS := -2144927696

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ENCRYPTION_LOSS := -2144927695

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DISK_FULL := -2144927694

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DISK_FULL_CLEAN := -2144927693

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_EA_NOT_SUPPORTED := -2144927692

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_CANT_REACH_SOURCE := -2144927691

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_RECYCLE_UNKNOWN_ERROR := -2144927691

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_RECYCLE_FORCE_NUKE := -2144927690

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_RECYCLE_SIZE_TOO_BIG := -2144927689

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_RECYCLE_PATH_TOO_LONG := -2144927688

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_RECYCLE_BIN_NOT_FOUND := -2144927686

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_NEWFILE_NAME_TOO_LONG := -2144927685

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_NEWFOLDER_NAME_TOO_LONG := -2144927684

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_DIR_NOT_EMPTY := -2144927683

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_FAT_MAX_IN_ROOT := -2144927682

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_ACCESSDENIED_READONLY := -2144927681

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_REDIRECTED_TO_WEBPAGE := -2144927680

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SERVER_BAD_FILE_TYPE := -2144927679

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_INTERNET_ITEM_UNAVAILABLE := -2144927678

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_CANNOT_MOVE_FROM_RECYCLE_BIN := -2144927677

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_CANNOT_MOVE_SHARED_FOLDER := -2144927676

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_ERROR := -2144927675

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_PAUSED := -2144927674

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_REQUIRES_EDP_CONSENT := -2144927673

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_BLOCKED_BY_EDP_POLICY := -2144927672

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE := -2144927671

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE := -2144927670

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_RMS_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE := -2144927669

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_RMS_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE := -2144927668

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_WARNED_BY_DLP_POLICY := -2144927667

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_BLOCKED_BY_DLP_POLICY := -2144927666

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SILENT_FAIL_BY_DLP_POLICY := -2144927665

/**
 * @type {Integer (Int32)}
 */
export global COPYENGINE_E_SUPPRESS_DIALOG := -2144927664

/**
 * @type {Integer (Int32)}
 */
export global NETCACHE_E_NEGATIVE_CACHE := -2144927488

/**
 * @type {Integer (Int32)}
 */
export global EXECUTE_E_LAUNCH_APPLICATION := -2144927487

/**
 * @type {Integer (Int32)}
 */
export global SHELL_E_WRONG_BITDEPTH := -2144927486

/**
 * @type {Integer (Int32)}
 */
export global LINK_E_DELETE := -2144927485

/**
 * @type {Integer (Int32)}
 */
export global STORE_E_NEWER_VERSION_AVAILABLE := -2144927484

/**
 * @type {Integer (Int32)}
 */
export global E_FILE_PLACEHOLDER_NOT_INITIALIZED := -2144927472

/**
 * @type {Integer (Int32)}
 */
export global E_FILE_PLACEHOLDER_VERSION_MISMATCH := -2144927471

/**
 * @type {Integer (Int32)}
 */
export global E_FILE_PLACEHOLDER_SERVER_TIMED_OUT := -2144927470

/**
 * @type {Integer (Int32)}
 */
export global E_FILE_PLACEHOLDER_STORAGEPROVIDER_NOT_FOUND := -2144927469

/**
 * @type {Integer (Int32)}
 */
export global CAMERAROLL_E_NO_DOWNSAMPLING_REQUIRED := -2144927456

/**
 * @type {Integer (Int32)}
 */
export global E_ACTIVATIONDENIED_USERCLOSE := -2144927440

/**
 * @type {Integer (Int32)}
 */
export global E_ACTIVATIONDENIED_SHELLERROR := -2144927439

/**
 * @type {Integer (Int32)}
 */
export global E_ACTIVATIONDENIED_SHELLRESTART := -2144927438

/**
 * @type {Integer (Int32)}
 */
export global E_ACTIVATIONDENIED_UNEXPECTED := -2144927437

/**
 * @type {Integer (Int32)}
 */
export global E_ACTIVATIONDENIED_SHELLNOTREADY := -2144927436

/**
 * @type {Integer (Int32)}
 */
export global LIBRARY_E_NO_SAVE_LOCATION := -2144927232

/**
 * @type {Integer (Int32)}
 */
export global LIBRARY_E_NO_ACCESSIBLE_LOCATION := -2144927231

/**
 * @type {Integer (Int32)}
 */
export global E_USERTILE_UNSUPPORTEDFILETYPE := -2144927216

/**
 * @type {Integer (Int32)}
 */
export global E_USERTILE_CHANGEDISABLED := -2144927215

/**
 * @type {Integer (Int32)}
 */
export global E_USERTILE_LARGEORDYNAMIC := -2144927214

/**
 * @type {Integer (Int32)}
 */
export global E_USERTILE_VIDEOFRAMESIZE := -2144927213

/**
 * @type {Integer (Int32)}
 */
export global E_USERTILE_FILESIZE := -2144927212

/**
 * @type {Integer (Int32)}
 */
export global IMM_ACC_DOCKING_E_INSUFFICIENTHEIGHT := -2144927184

/**
 * @type {Integer (Int32)}
 */
export global IMM_ACC_DOCKING_E_DOCKOCCUPIED := -2144927183

/**
 * @type {Integer (Int32)}
 */
export global IMSC_E_SHELL_COMPONENT_STARTUP_FAILURE := -2144927181

/**
 * @type {Integer (Int32)}
 */
export global SHC_E_SHELL_COMPONENT_STARTUP_FAILURE := -2144927180

/**
 * @type {Integer (Int32)}
 */
export global E_TILE_NOTIFICATIONS_PLATFORM_FAILURE := -2144927159

/**
 * @type {Integer (Int32)}
 */
export global E_SHELL_EXTENSION_BLOCKED := -2144926975

/**
 * @type {Integer (Int32)}
 */
export global E_IMAGEFEED_CHANGEDISABLED := -2144926960

/**
 * @type {Guid}
 */
export global CLSID_CUrlHistory := Guid("{3c374a40-bae4-11cf-bf7d-00aa006946ee}")

/**
 * @type {Guid}
 */
export global CLSID_CUrlHistoryBoth := Guid("{6659983c-8476-4eb4-b78c-e5968f326ba0}")

/**
 * @type {Integer (Int32)}
 */
export global ISHCUTCMDID_DOWNLOADICON := 0

/**
 * @type {Integer (Int32)}
 */
export global ISHCUTCMDID_INTSHORTCUTCREATE := 1

/**
 * @type {Integer (Int32)}
 */
export global ISHCUTCMDID_COMMITHISTORY := 2

/**
 * @type {Integer (Int32)}
 */
export global ISHCUTCMDID_SETUSERAWURL := 3

/**
 * @type {Integer (Int32)}
 */
export global SFBID_PIDLCHANGED := 0

/**
 * @type {Integer (Int32)}
 */
export global DBCID_EMPTY := 0

/**
 * @type {Integer (Int32)}
 */
export global DBCID_ONDRAG := 1

/**
 * @type {Integer (Int32)}
 */
export global DBCID_CLSIDOFBAR := 2

/**
 * @type {Integer (Int32)}
 */
export global DBCID_RESIZE := 3

/**
 * @type {Integer (Int32)}
 */
export global DBCID_GETBAR := 4

/**
 * @type {Integer (Int32)}
 */
export global DBCID_UPDATESIZE := 5

/**
 * @type {Integer (Int32)}
 */
export global BMICON_LARGE := 0

/**
 * @type {Integer (Int32)}
 */
export global BMICON_SMALL := 1

/**
 * @type {Integer (Int32)}
 */
export global CTF_INSIST := 1

/**
 * @type {Integer (Int32)}
 */
export global CTF_THREAD_REF := 2

/**
 * @type {Integer (Int32)}
 */
export global CTF_PROCESS_REF := 4

/**
 * @type {Integer (Int32)}
 */
export global CTF_COINIT_STA := 8

/**
 * @type {Integer (Int32)}
 */
export global CTF_COINIT := 8

/**
 * @type {Integer (Int32)}
 */
export global CTF_FREELIBANDEXIT := 16

/**
 * @type {Integer (Int32)}
 */
export global CTF_REF_COUNTED := 32

/**
 * @type {Integer (Int32)}
 */
export global CTF_WAIT_ALLOWCOM := 64

/**
 * @type {Integer (Int32)}
 */
export global CTF_UNUSED := 128

/**
 * @type {Integer (Int32)}
 */
export global CTF_INHERITWOW64 := 256

/**
 * @type {Integer (Int32)}
 */
export global CTF_WAIT_NO_REENTRANCY := 512

/**
 * @type {Integer (Int32)}
 */
export global CTF_KEYBOARD_LOCALE := 1024

/**
 * @type {Integer (Int32)}
 */
export global CTF_OLEINITIALIZE := 2048

/**
 * @type {Integer (Int32)}
 */
export global CTF_COINIT_MTA := 4096

/**
 * @type {Integer (Int32)}
 */
export global CTF_NOADDREFLIB := 8192
;@endregion Constants
