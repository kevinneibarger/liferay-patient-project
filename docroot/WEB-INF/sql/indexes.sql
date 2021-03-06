create index IX_888A0617 on PatientReg_PatientRegistration (firstName);
create index IX_6DC46A4C on PatientReg_PatientRegistration (firstName, lastName);
create index IX_DEAF281C on PatientReg_PatientRegistration (firstName, lastName, optIn);
create index IX_C203C1F1 on PatientReg_PatientRegistration (firstName, optIn);
create index IX_881A5776 on PatientReg_PatientRegistration (groupId);
create index IX_9A054BA9 on PatientReg_PatientRegistration (lastName);
create index IX_FAC741F on PatientReg_PatientRegistration (lastName, optIn);
create index IX_F84CA5B4 on PatientReg_PatientRegistration (optIn);
create index IX_F9F5F855 on PatientReg_PatientRegistration (patientRegistrationId);
create index IX_3DAB4F80 on PatientReg_PatientRegistration (uuid_);
create index IX_A1CA04A8 on PatientReg_PatientRegistration (uuid_, companyId);
create unique index IX_63DB952A on PatientReg_PatientRegistration (uuid_, groupId);